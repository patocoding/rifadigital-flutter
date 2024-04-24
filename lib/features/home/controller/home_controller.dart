import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController{

static HomeController get instance => Get.find();
final FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> logout(BuildContext context) async {
    try {
      // Supondo que você envie o token para o servidor para ser invalidado
      var response = await http.post(
        Uri.parse('http://10.0.2.2:3000/logout'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          
        },
      );

      if (response.statusCode == 200) {
        // clearLocalData();  // Limpa dados locais, como tokens de sessão
        Get.offAllNamed('/login');  // Redireciona para a tela de login
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Logout realizado com sucesso!'),
        ));
      } else {
        throw Exception('Falha ao realizar logout');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Erro ao realizar logout: ${e.toString()}'),
      ));
    }
  }

void openMenu(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Wrap(
        children: <Widget>[
          ListTile(
            leading: const Icon(Iconsax.logout),  // Exemplo de ícone
            title: const Text('Sair'),
            onTap: () async {
              await _auth.signOut();
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Logout realizado com sucesso!'),
            ));
            Modular.to.navigate('/login');
              // Adicione a ação desejada aqui
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurações'),
            onTap: () {
              Navigator.pop(context);
              // Adicione a ação desejada aqui
            },
          ),
          // Adicione mais itens conforme necessário
        ],
      );
    },
  );
}


}

