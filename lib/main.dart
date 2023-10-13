import 'package:flutter/material.dart';
import 'package:lista_contatos/pages/add_contact.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AddContact()
    );
  }
}