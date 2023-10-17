import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lista_contatos/pages/add_contact.dart';
import 'package:lista_contatos/pages/list_contacts.dart';

void main() async {
  await dotenv.load(fileName: "lib/constants/.env");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ContacList()
    );
  }
}