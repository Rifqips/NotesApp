import 'package:flutter/material.dart';
import 'package:flutter_habiskerja_notes_app/pages/form_page.dart';
import 'package:flutter_habiskerja_notes_app/pages/home_page.dart';
import 'package:flutter_habiskerja_notes_app/utils/user_shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController nameController;
  late TextEditingController pinController;
  bool isPinExist = false;
  String? _pin;

  @override
  void initState() {
    nameController = TextEditingController();
    pinController = TextEditingController();
    String? pin = UserSharedPreferences.getPin();
    if (pin != null) {
      setState(() {
        isPinExist = true;
        _pin = pin;
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    pinController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Buku Catatan',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          const Text(
            'Nama',
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: TextField(
              autofocus: true,
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                contentPadding: const EdgeInsets.all(0),
              ),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          const Text(
            'PIN',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 8,
            ),
            child: TextField(
              controller: pinController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                contentPadding: const EdgeInsets.all(0),
              ),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () async {
              await UserSharedPreferences.setName(
                name: nameController.text,
                pin: pinController.text,
              );
              // ignore: use_build_context_synchronously
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
                return const HomePage();
              }));
            },
            child: const Text(
              'Login',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
