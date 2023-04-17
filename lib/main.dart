import 'package:flutter/material.dart';
import 'package:flutter_habiskerja_notes_app/pages/login_page.dart';
import 'package:flutter_habiskerja_notes_app/utils/user_shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSharedPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
