import 'package:flutter/material.dart';

import 'screens/detail_screen.dart';
import 'screens/root_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const RootScreen(),
        DetailScreen.routeName: (_) => const DetailScreen(),
      },
    );
  }
}
