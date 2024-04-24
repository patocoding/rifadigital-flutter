import "package:firstly/features/home/controller/stream_controller.dart";
import "package:firstly/utils/theme/theme.dart";
import "package:flutter/material.dart";
import "package:flutter_modular/flutter_modular.dart";
import 'package:shimmer/shimmer.dart';
import "package:skeletonizer/skeletonizer.dart";
// Para decodificação de JSON




class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    // Adicione aqui a sua lógica de inicialização
    // Por exemplo, configurar listeners, buscar dados, etc.
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      routerConfig: Modular.routerConfig,
    );
  }
}



// class Test extends StatefulWidget {
//   const Test({super.key});

//   @override
//   _TestState createState() => _TestState();
// }

// class _TestState extends State<Test> {
//   bool _loading = false;

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//   stream: FirebaseFirestore.instance.collection('users').snapshots(),
//   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//     if (snapshot.hasError) {
//       return const Text('Something went wrong');
//     }

//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return buildSkeleton(context);
//     }

//    if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) { // Diretamente retorna a lista se os dados estiverem prontos
//     return ListView(
//       children: snapshot.data!.docs.map((DocumentSnapshot document) {
//         Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
//         return ListTile(
//           title: Text(data['name'] ?? 'No Name'),
//           subtitle: Text(data['email'] ?? 'No Email'),
//         );
//       }).toList(),
//     );
//     }else{
//        return const Center(child: Text("No data available"));
//     }
//   },
// );
//   }
// }

Widget buildSkeleton(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: ListView.builder(
      itemCount: 6, // Número de linhas do skeleton
      itemBuilder: (_, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: ListTile(
          title: Container(
            width: double.infinity,
            height: 10.0,
            color: Colors.white,
          ),
          subtitle: Container(
            width: double.infinity,
            height: 10.0,
            margin: const EdgeInsets.only(top: 5.0),
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}

