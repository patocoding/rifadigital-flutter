import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}

class Categories {
  final int id;
  final String name;
  final String image;

  Categories({required this.id, required this.name, required this.image});

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}



// Future<List<User>> fetchUsers() async {
//   final response = await http.get(Uri.parse('http://10.0.2.2:3000/users'));  // Use o IP correto para seu ambiente de desenvolvimento

//   if (response.statusCode == 200) {
//     List<dynamic> usersJson = jsonDecode(response.body);
//     return usersJson.map((json) => User.fromJson(json)).toList();
//   } else {
//     throw Exception('Failed to load users');
//   }
// }

// class UsersPage extends StatelessWidget {
//   const UsersPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<User>>(
//       future: fetchUsers(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Text("Error: ${snapshot.error}");
//         }

//         // Retorna diretamente o widget desejado sem Scaffold e AppBar
//         return SizedBox(
//           height: 120.0,  // Restringindo a altura
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,  // Tornando o ListView horizontal se preferir
//             itemCount: snapshot.data?.length ?? 0,
//             itemBuilder: (context, index) {
//               User user = snapshot.data![index];
//               return Container(  // Usando Container para limitar o tamanho do conteúdo
//                   // Definindo uma largura fixa para cada item
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,  // Fazendo a Column ser tão alta quanto seu menor conteúdo
//                   children: [
//                     Text(user.email),
//                     const SizedBox(height: 12.0,),
//                     Text(user.name)
//                   ],
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }

Future<List<Categories>> fetchCategories() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:3000/fetchCategories'));

  if (response.statusCode == 200) {
    List<dynamic> categories = jsonDecode(response.body);
    return categories.map((json) => Categories.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load categories');
  }
}
