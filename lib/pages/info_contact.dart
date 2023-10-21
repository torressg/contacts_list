import 'package:flutter/material.dart';

class InfoContact extends StatefulWidget {
  final Key? key;
  final String nomeContato;

  InfoContact({this.key, required this.nomeContato});

  @override
  State<InfoContact> createState() => _InfoContactState();
}

class _InfoContactState extends State<InfoContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Informação do contato'),
        ),
        body: Container(child: Column(children: [Text(widget.nomeContato)]),));
  }
}
