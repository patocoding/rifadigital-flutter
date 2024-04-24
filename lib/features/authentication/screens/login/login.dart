

import 'package:firstly/common/styles/styles_padding.dart';
import 'package:firstly/features/authentication/screens/login/widgets/login_form.dart';
import 'package:firstly/features/authentication/screens/login/widgets/login_header.dart';

import 'package:firstly/utils/constants/sizes.dart';
import 'package:firstly/utils/helpers/helper.dart';
import 'package:flutter/material.dart';




class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    final dark = THelper.isDarkMode(context);

    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpaceStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const LoginHeader(),
              const SizedBox(height: TSizes.lg),
               LoginForm(),
              FormDivider(dark: dark),
              const SizedBox(height: 16.0,),
              const SocialButtons()
            ],
          ),
          ),
      

      ) 
      );
  }
  
}



