import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lista_contatos/pages/edit_contact.dart';

class InfoContact extends StatefulWidget {
  final Key? key;
  final String nomeContato;
  final String numeroContato;
  final String imgSrc;
  final String contatoId;

  InfoContact(
      {this.key,
      required this.imgSrc,
      required this.nomeContato,
      required this.numeroContato,
      required this.contatoId});

  @override
  State<InfoContact> createState() => _InfoContactState();
}

class _InfoContactState extends State<InfoContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Informação do contato'),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditContactPage(
                                imgSrc: widget.imgSrc,
                                nomeContato: widget.nomeContato,
                                numeroContato: widget.numeroContato,
                                contatoId: widget.contatoId,
                              )),
                    );
                  });
                },
                icon: Icon(Icons.edit))
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(children: [
            SizedBox(
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
                initialValue: widget.nomeContato,
                enabled: false,
                decoration: const InputDecoration(
                    labelText: "Nome do contato",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)))),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextFormField(
                initialValue: widget.numeroContato,
                enabled: false,
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
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone, color: Colors.white),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Ligar",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.green),
                      alignment: Alignment.center)),
            )
          ]),
        ));
  }
}
