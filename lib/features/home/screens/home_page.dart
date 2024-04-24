
import 'package:firstly/app.dart';
import 'package:firstly/features/home/controller/home_controller.dart';
import 'package:firstly/features/home/controller/stream_controller.dart';
import 'package:firstly/features/home/screens/widgets/categories_section.dart';
import 'package:firstly/features/home/screens/widgets/emalta_section.dart';
import 'package:firstly/utils/constants/colors.dart';
import 'package:firstly/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:convert';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homeController = Modular.get<HomeController>();

  @override
    Widget build(BuildContext context) {
      var response = '{"id": "1", "title": "Task", "isCompleted": false}';
      var decoded = jsonDecode(response);
      print(decoded);
      print(response);
      var task = Task.fromJson(decoded);
     print(decoded.map((json) => Task.fromJson(json)).toList());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rifa Digital',
        style: TextStyle(color: Colors.white),),
        backgroundColor: TColors.primaryColor,
           actions: <Widget>[
    IconButton(
      icon: const Icon(Iconsax.menu_14), 
      onPressed: () {
        homeController.openMenu(context);
      },
    ),
  ]
  ),
      body:
        const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            BuyRaffles(),
             SizedBox(height: 20),
             Padding(
               padding: EdgeInsets.all(8.0),
               
               child: Text(
                'Categorias',
                 style: TextStyle(fontSize: TSizes.textSmall, fontWeight: FontWeight.bold),
                 textAlign: TextAlign.start,),
             ),
              SizedBox(height: 10),
              CategoriesList(),
              SizedBox(height: 10),
              EmAlta(),
            // Outros widgets podem ser adicionados aqui
          ],
        ),
      ),
    );
  }
}

class Task {
  String id;
  String title;
  bool isCompleted;

  Task({required this.id, required this.title, this.isCompleted = false});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as String,
      title: json['title'] as String,
      isCompleted: json['isCompleted'] as bool,
    );
  }
}

class BuyRaffles extends StatelessWidget {
  const BuyRaffles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(color: TColors.primaryColor,borderRadius: BorderRadius.circular(8), boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),  // Cor da sombra
          spreadRadius: 0,  // Quão longe a sombra deve se estender desde a borda do container
          blurRadius: 10,  // Quão borrada a sombra deve ser
          offset: const Offset(0, 2),  // A direção e intensidade da sombra (horizontal, vertical)
        ),
      ], ),       
    child: const Text('Compre Rifas', style: TextStyle( color: Colors.white ,height: 2, wordSpacing:-1),),
    
    );
  }
}

