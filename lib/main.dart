import 'package:coffee_app/isar_db/coffee.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [CoffeeSchema],
    directory: dir.path,
  );
  runApp(const Sandbox());
}

// GoRouter configuration
final _router = GoRouter(
  errorBuilder: (context, state) => const Scaffold(
    body: Center(
      child: Text('Page not found'),
    ),
  ),
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const Home(),
    ),
    GoRoute(
      path: '/second',
      builder: (BuildContext context, GoRouterState state) =>
          const SecondScreen(),
    )
  ],
);

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: const Placeholder(),
    );
  }
}

//Sample code for rows
 // return Scaffold(
    //     appBar: AppBar(
    //       title: const Text("Sandbox"),
    //       backgroundColor: Colors.grey,
    //     ),
    //     body: Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         crossAxisAlignment: CrossAxisAlignment.end,
    //         children: [
    //           Container(
    //             height: 400,
    //             color: Colors.red,
    //             child: Text("1"),
    //           ),
    //           Container(
    //             height: 200,
    //             color: Colors.green,
    //             child: Text("2"),
    //           ),
    //           Container(
    //             height: 150,
    //             color: Colors.grey,
    //             child: Text("3"),
    //           ),
    //           Container(
    //             height: 200,
    //             color: Colors.yellow,
    //             child: Text("4"),
    //           )
    //         ]));
