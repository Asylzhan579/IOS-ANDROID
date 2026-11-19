import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'services/storage_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await StorageService.init();

  runApp(NotesVaultApp(storage: storage));
}

class NotesVaultApp extends StatefulWidget {
  final StorageService storage;
  const NotesVaultApp({super.key, required this.storage});

  @override
  State<NotesVaultApp> createState() => _NotesVaultAppState();
}

class _NotesVaultAppState extends State<NotesVaultApp> {
  late bool _isDark = widget.storage.isDarkMode;

  Future<void> _setDark(bool value) async {
    setState(() => _isDark = value);
    await widget.storage.setDarkMode(value);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes & Settings Vault',
      debugShowCheckedModeBanner: false,
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: HomeScreen(
        storage: widget.storage,
        isDark: _isDark,
        onDarkChanged: _setDark,
      ),
    );
  }
}
