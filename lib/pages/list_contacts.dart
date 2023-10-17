import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lista_contatos/models/contact_model.dart';
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
              itemCount: lenghtContactList,
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                  leading: imagemContato[index]!="sem imagem" ? Image.file(File(imagemContato[index]), fit: BoxFit.cover,) : Icon(Icons.person),
                  title: Text(nomeContato[index]),
                  trailing: Text("teste"),
                  onTap: () {},
                );
              })),
    );
  }
}