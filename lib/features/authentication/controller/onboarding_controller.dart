import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();
  final FirebaseFirestore firestore = Modular.get<FirebaseFirestore>();
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  void updatePageIndicator(index) {
    currentPageIndex.value = index;
  }

  void addUser() {
  firestore.collection('users').add({
    'name': 'John Doe',
    'email': 'john.doe@example.com',
  });
}

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
   }

  void nextPage() {
    if(currentPageIndex.value == 2) {
      Modular.to.navigate('/login');
      completeOnboarding();
    } else {
      int page = currentPageIndex.value + 1;
      // Ajuste aqui: multiplicar o número da página pela largura da página
      final position = (page * pageController.position.viewportDimension);
      pageController.jumpTo(position.toDouble()); // Convertido para double
      
    }
  }

  void skipPage() {
    currentPageIndex.value = 2;
    // Ajuste aqui: considerar a largura da página vezes o índice
    final position = (2 * pageController.position.viewportDimension);
    pageController.jumpTo(position.toDouble()); // Convertido para double
  } 

  Future<bool> isOnboardingCompleted() async {
    print("Iniciando acesso ao SharedPreferences isOnBoardingCompleted");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboardingCompleted') ?? false;
  }

   Future<void> completeOnboarding() async {
    print("Iniciando acesso ao SharedPreferences completeOnboro");
   try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingCompleted', true);
  } catch (e) {
    print('Erro ao completar onboarding: $e');
    throw Exception('Erro ao acessar SharedPreferences: $e');
  }
}

  Future<bool> checkFirstSeen() async {
    print("Iniciando acesso ao SharedPreferences checkFirstSeen");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    if (!_seen) {
      await prefs.setBool('seen', true);
      return false;  // Not seen, show onboarding
    }
    return true;  // Seen, skip onboarding
  }
}