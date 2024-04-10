import 'package:flutter/material.dart';
import 'package:golfino/MyHomePage.dart';
import 'package:golfino/PaymentPage.dart';
import 'package:golfino/Roleta.dart';
import 'package:golfino/player_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "/roleta": (context) => const MyHomePage(title: 'golfinho'),
        '/player': (context) => const PlayerPage(),
        '/pay-ment': (context) => const PaymentPage(),
        '/': (context) =>  CassinoScreen()
      },
    );
  }
}
