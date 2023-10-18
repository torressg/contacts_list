import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lista_contatos/models/contact_model.dart';
import 'package:lista_contatos/pages/add_contact.dart';
import 'package:lista_contatos/repositories/contact_repository.dart';

class ContacList extends StatefulWidget {
  const ContacList({super.key});

  @override
  State<ContacList> createState() => _ContacListState();
}

class _ContacListState extends State<ContacList> {
  var ContactRep = ContactsRepository();
  List<String> nomeContato = [];
  List<String> numContato = [];
  List<String> imagemContato = [];

  int lenghtContactList = 0;

  Future<void> listContacts() async {
    ContactModel result = await ContactRep.get();
    setState(() {
      lenghtContactList = result.results.length;
      nomeContato = result.results.map((item) => item.nomeContato).toList();
      numContato = result.results.map((item) => item.numeroContato).toList();
      imagemContato = result.results.map((item) => item.imagemContato).toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      body: Container(
          child: ListView.builder(
              itemCount: lenghtContactList + 1,
              itemBuilder: (BuildContext context, index) {
                if (index == 0) {
                  return ListTile(
                    leading: Icon(Icons.add, size: 35),
                    title: Text('Adicionar novo contato'),
                    onTap: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddContact()),
                    );
                    },
                  );
                }
                int contactIndex = index - 1;
                return ListTile(
                  leading: imagemContato[contactIndex] != "sem imagem"
                      ? ClipOval(
                          child: Image.file(
                          File(imagemContato[contactIndex]),
                          fit: BoxFit.cover,
                          height: 40,
                          width: 40,
                        ))
                      : Icon(
                          Icons.person,
                          size: 35,
                        ),
                  title: Text(
                    nomeContato[contactIndex],
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddContact()),
                    );
                  },
                );
              })),
    );
  }
}
