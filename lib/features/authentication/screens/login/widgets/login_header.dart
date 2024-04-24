import 'package:firstly/utils/constants/image_strings.dart';
import 'package:firstly/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Image(
          height: 150,
          image: AssetImage(TImages.appLogo)
          )
        , Text(
          'Bem-vindo a Rifa Digital',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: TSizes.sm),
        Text(
          'Faça login para continuar',
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}