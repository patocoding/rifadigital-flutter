
import 'package:firstly/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:firstly/utils/helpers/helper.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelper.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body:  SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Faça o registro em Rifa Digital',style:  Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 32.0,),
             SignupForm(dark: dark)
          ],
        ),
        ),
      ),
    );
  }
}

