import 'package:firstly/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EmAlta extends StatelessWidget {
  const EmAlta({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child:  Text(
                'Em Alta',
                style: TextStyle(fontSize: TSizes.textSmall),
                ),
                
            ),
            Icon(
              color: Colors.red,
              Iconsax.heart,
              size: 20,)
          ],
          
        )
        
      ],
    );
  }
}