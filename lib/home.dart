import 'package:coffee_app/coffee_prefs.dart';
import 'package:coffee_app/main.dart';
import 'package:coffee_app/styled_body_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Coffee Stop !',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.brown[700],
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.connect_without_contact_sharp),
            color: Colors.white,
            iconSize: 35,
            onPressed: () {
              print('Navigating to the second screen...');
              // Navigate to the second screen
              context.push('/second');
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.brown[200],
            padding: const EdgeInsets.all(20),
            child: const StyledBodyText('Welcome to Coffee Stop !'),
          ),
          Container(
            color: Colors.brown[100],
            padding: const EdgeInsets.all(20),
            child: const CoffeePrefs(),
          ),
          Expanded(
              child: Image.asset(
            'assets/img/coffee_bg.jpg',
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          )),
        ],
      ),
    );
  }
}
