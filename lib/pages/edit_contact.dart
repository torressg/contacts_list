import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lista_contatos/repositories/contact_repository.dart';

class EditContactPage extends StatefulWidget {
  final Key? key;
  final String nomeContato;
  final String numeroContato;
  final String imgSrc;
  final String contatoId;

  EditContactPage(
      {this.key,
      required this.imgSrc,
      required this.nomeContato,
      required this.numeroContato,
      required this.contatoId});

  @override
  State<EditContactPage> createState() => _EditContactPageState();
}

class _EditContactPageState extends State<EditContactPage> {
  var ContactRep = ContactsRepository();
  TextEditingController nomeContato = TextEditingController();
  TextEditingController numContato = TextEditingController();

  Future<void> EditContact() async {
    await ContactRep.EditContact(
        nomeContato.text, numContato.text, widget.contatoId);
  }

  @override
  void initState() {
    super.initState();
    nomeContato.text = widget.nomeContato;
    numContato.text = widget.numeroContato;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Editar contato'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            ClipOval(
                child: Image.file(
              File(widget.imgSrc),
              fit: BoxFit.cover,
              height: 120,
              width: 120,
            )),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextFormField(
                controller: nomeContato,
                decoration: const InputDecoration(
                    labelText: "Nome do contato",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)))),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextFormField(
                controller: numContato,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    labelText: "Número do contato",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)))),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextButton(
                  onPressed: () async {
                    await EditContact();
                  },
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.blue),
                      alignment: Alignment.center),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Salvar",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.red),
                      alignment: Alignment.center),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Excluir",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )),
            )
          ]),
        ));
  }
}
