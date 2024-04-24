import 'package:firstly/features/authentication/models/auth/signup_store.dart';
import 'package:firstly/features/authentication/screens/login/widgets/login_form.dart';
import 'package:firstly/features/authentication/screens/signup/widgets/therms_and_conditions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iconsax/iconsax.dart';

class SignupForm extends StatelessWidget {

   SignupForm({
    super.key,
    required this.dark,
  });

   final SignupStore store = Modular.get<SignupStore>();

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Form(child: Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       Row(
         children: [
           Expanded(
             child: TextFormField(
              onChanged: store.setName,
               expands: false,
               decoration: const  InputDecoration(
                 labelText: 'Nome',
                 prefixIcon:Icon( Iconsax.user)
               ),
             ),
           ),
           const SizedBox(width: 16.0,),
           Expanded(
             child: TextFormField(
              onChanged: store.setLastName,
               expands: false,
               decoration: const  InputDecoration(
                 labelText: 'Sobrenome',
                 prefixIcon:Icon( Iconsax.user)
               ),
             ),
           ),
         ],
       ),
       const SizedBox(height: 32.0,),
       TextFormField(
              onChanged: store.setUsername,
               decoration: const  InputDecoration(
                 labelText: 'Nome de usuário',
                 prefixIcon:Icon( Iconsax.user_edit)
               ),
             ),
             const SizedBox(height: 32.0,),
       TextFormField(
              onChanged: store.setEmail,
               decoration: const  InputDecoration(
                 labelText: 'Email',
                 prefixIcon:Icon( Iconsax.direct)
               ),
             ),
             const SizedBox(height: 32.0,),
       TextFormField(
                onChanged: store.setPhone,
               decoration: const  InputDecoration(
                 labelText: 'Telefone',
                 prefixIcon:Icon( Iconsax.call)
               ),
             ),
             const SizedBox(height: 32.0,),
       TextFormField(
               obscureText: true,
                onChanged: store.setPassword,
               decoration: const  InputDecoration(
                 labelText: 'Senha',
                 prefixIcon:Icon( Iconsax.password_check),
                 suffixIcon: Icon(Iconsax.eye_slash)
               ),
             ),
             const SizedBox(height: 32.0,),
             ThermsAndConditions(dark: dark),
             const SizedBox(height: 32.0,),
            SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              await store.signup();
              if (store.errorMessage != null) {
                // Mostra algum erro se o cadastro falhar
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(store.errorMessage!),
                ));
              }
             
            },
            child: const Text('Criar Conta'),
          ),
        ),
   
             const SizedBox(height: 32.0,),
             FormDivider(dark: dark),
             const SizedBox(height: 32.0,),
             const SocialButtons()
     ],
     )
     );
     
  }
}

