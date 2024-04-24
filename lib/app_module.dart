import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstly/features/authentication/controller/onboarding_controller.dart';
import 'package:firstly/features/authentication/models/auth/login_store.dart';
import 'package:firstly/features/authentication/models/auth/signup_store.dart';
import 'package:firstly/features/authentication/screens/login/login.dart';
import 'package:firstly/features/authentication/screens/onboarding.dart';
import 'package:firstly/features/authentication/screens/signup/signup.dart';
import 'package:firstly/features/category/screens/category_screen.dart';
import 'package:firstly/features/home/controller/home_controller.dart';
import 'package:firstly/features/home/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';




class AppModule extends Module {

  @override
  void binds(i) {
    i.addSingleton(SignupStore.new);
    i.addSingleton(LoginStore.new);
    i.addSingleton(OnBoardingController.new);
   i.addInstance(FirebaseFirestore.instance);
   i.addSingleton(HomeController.new);
  }

  @override
  void routes(r) {
    // r.child('/', child: (_, args) => FutureBuilder<bool>(
    //   future: Get.find<OnBoardingController>().checkFirstSeen(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const Center(child: CircularProgressIndicator());
    //     }
    //     if (snapshot.data == false) {
    //       return OnBoardingScreen();
    //     } else {
    //       return const HomePage(); // Ajuste para a página inicial adequada
    //     }
    //   },
    // ));

  final OnBoardingController controller = Modular.get<OnBoardingController>();
    
    r.child('/', child: (context) => FutureBuilder<bool>(
      future: controller.checkFirstSeen(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data == false) {
         
          print('Onboarding');
          return OnBoardingScreen();
        } else {
           return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          // Checa se o snapshot tem dados e se não é nulo
          if (snapshot.hasData && snapshot.data != null) {
            return  HomePage(); // Usuário está logado, vai para a HomePage
          } else {
            return const LoginScreen(); // Usuário não está logado, vai para a LoginScreen
          }
        }
        return const CircularProgressIndicator(); // Mostra um spinner enquanto verifica o estado de login
      },
    );
        }
      },
    ));
    // r.child('/', child: (context) =>  OnBoardingScreen());
    r.child('/login', child: (context) => const LoginScreen());
    r.child('/signup', child: (context) => const SignupScreen());
    r.child('/home', child: (context) =>  HomePage());
    r.child('/category/:categoryId', child: (_) => CategoryDetailsPage(categoryId: r.args.params['categoryId']));
    // outras rotas...
  }
}