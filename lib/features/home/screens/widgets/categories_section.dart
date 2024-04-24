
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstly/features/home/controller/stream_controller.dart';
import 'package:firstly/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Categories>>(
      future: fetchCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        return SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              var data = snapshot.data![index];
              print(snapshot);
              return GestureDetector(
                onTap: () {
                  // Navegação com base no ID da categoria, se necessário
                  Modular.to.pushNamed('/category/${data.id}');
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(data.image),
                        backgroundColor: Colors.transparent,
                      ),
                      const SizedBox(height: 8),
                      Text(data.name, style: const TextStyle(fontSize: TSizes.textSmall)),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

