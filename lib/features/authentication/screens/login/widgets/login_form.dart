import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstly/features/authentication/models/auth/login_store.dart';
import 'package:firstly/utils/constants/colors.dart';
import 'package:firstly/utils/constants/image_strings.dart';
import 'package:firstly/utils/constants/sizes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iconsax/iconsax.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context)  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100)),
          child:IconButton(
           onPressed: () {},
            icon: const Image(image: AssetImage(TImages.googleLogo),
             width: TSizes.iconSizeMedium,
            height:TSizes.iconSizeMedium),
          ),
        ),
        const SizedBox(width: 16.0),
        Container(
          decoration: BoxDecoration(border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100)),
          child:IconButton(
           onPressed: () {},
            icon: const Image(image: AssetImage(TImages.facebookLogo),
             width: TSizes.iconSizeMedium,
            height:TSizes.iconSizeMedium),
          ),
        )
      ],  
    );
  }
}

class FormDivider extends StatelessWidget {
  const FormDivider({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
       Flexible(child: Divider(color: dark ? TColors.darkGrey : TColors.grey, thickness: 1, indent: 60, endIndent: 5,)),
        Text('Ou use', style: Theme.of(context).textTheme.labelMedium,),
        Flexible(child: Divider(color: dark ? TColors.darkGrey : TColors.grey, thickness: 1, indent: 5, endIndent:60,))
     ],
     );
  }
}

class LoginForm extends StatelessWidget {
  LoginForm({
    super.key,
  });
   final LoginStore store = Modular.get<LoginStore>();
    final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
     child: Padding(
       padding: const EdgeInsets.symmetric(vertical: TSizes.defaultSpacing),
       child: Column(
       children: [
         //Email
         TextFormField(
          onChanged: store.setUsername,
           autofocus: false,
           decoration: const InputDecoration(
             prefixIcon: Icon(Iconsax.direct_right),
             labelText: 'E-mail',
             labelStyle: TextStyle(color: TColors.darkGrey),
             focusedBorder: UnderlineInputBorder(
               borderSide:  BorderSide(
                 color: TColors.primaryColor,
                 width: 2
               )
             ),
           enabledBorder: UnderlineInputBorder(
               borderSide: BorderSide(
             color: Colors.black,
             width: 2,
           )),
           ),
         ),
         const SizedBox(height: TSizes.md),
         TextFormField(
          onChanged: store.setPassword,
           obscureText: true,
           decoration: const InputDecoration(
             prefixIcon: Icon(Iconsax.password_check),
             labelText: 'Senha',
             labelStyle: TextStyle(color: TColors.darkGrey),
             suffixIcon: Icon(Iconsax.eye),
             focusedBorder: UnderlineInputBorder(
               borderSide:  BorderSide(
                 color: TColors.primaryColor,
                 width: 2
               )
             ),
           enabledBorder: UnderlineInputBorder(
               borderSide: BorderSide(
             color: Colors.black,
             width: 2,
           )),
           ),
         ),
         const SizedBox(height: TSizes.md,),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Row(
               children: [
                 Checkbox(value: true, onChanged: (value) {}),
                 const Text('Lembrar de mim')
               ],
             ),
       
             TextButton(onPressed: (){}, child: const Text('Esqueci minha senha'))
           ],
         ),
                     const SizedBox(height: 32.0,),
                     //SIGN IN
                     SizedBox(
                     width: double.infinity, 
                     child: 
                     ElevatedButton(onPressed: () {
                        try {
                          store.login();
                          print(store.username);
                        }  catch (e) {
                          print('Failed with error code: ${e}');
                          
                        }
                      }, 
                     child: const Text('Entrar', style: TextStyle(color: TColors.white),))),
                      const SizedBox(height: 16.0,),
                     SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () => Modular.to.navigate('/signup')
                     , child: const Text('Criar conta'))),
                     ],),
     )
                  );
  }
}