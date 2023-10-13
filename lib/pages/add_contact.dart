import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Contato"),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            IconButton(
                iconSize: 100,
                alignment: Alignment.center,
                onPressed: () async {
                  showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return Wrap(
                          children: [
                            ListTile(
                              leading: Icon(Icons.camera),
                              title: Text("Câmera"),
                              onTap: () async {
                                final XFile? photo = await _picker.pickImage(
                                    source: ImageSource.camera);
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.photo_library),
                              title: Text("Galeria"),
                              onTap: () async {
                                final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                              },
                            )
                          ],
                        );
                      });
                },
                icon: Icon(size: 100, Icons.camera_alt)),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "Nome do contato",
                    hintText: "Digite o nome do contato",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
