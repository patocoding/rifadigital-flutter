import 'package:firstly/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ThermsAndConditions extends StatelessWidget {
  const ThermsAndConditions({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        
        SizedBox(width: 24,height: 24,child: Checkbox(value:true, onChanged: (value) {})),
         Text.rich(TextSpan(
          children: [
            TextSpan(text: 'Concordo com os ', style: Theme.of(context).textTheme.labelLarge),
            TextSpan(text: 'Termos e Serviços', style: Theme.of(context).textTheme.labelLarge!.apply(
              color: dark ? Colors.white : TColors.primaryColor,
              decoration: TextDecoration.underline,
              decorationColor: dark ? TColors.white : TColors.darkGrey
            ))
          ] ))
      ],
    );
  }
}