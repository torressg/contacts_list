import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lista_contatos/repositories/contact_repository.dart';
import 'package:path_provider/path_provider.dart' as pathPackage;
import 'package:path/path.dart';
import 'package:gallery_saver/gallery_saver.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final ImagePicker _picker = ImagePicker();
  var ContactRep = ContactsRepository();
  XFile? selectedImage;
  TextEditingController nomeContato = TextEditingController();
  TextEditingController numContato = TextEditingController();
  String pathImage = "";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastre um novo contato"),
      ),
      body: Stack(
        children: [
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                IconButton(
                  icon: selectedImage == null
                      ? Icon(Icons.camera_alt, size: 100)
                      : ClipOval(
                          child: Image.file(
                          File(selectedImage!.path),
                          fit: BoxFit.cover,
                          height: 120,
                          width: 120,
                        )),
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
                                  if (photo != null) {
                                    String path = (await pathPackage
                                            .getApplicationDocumentsDirectory())
                                        .path;
                                    String name = basename(photo.path);
                                    await photo.saveTo("$path/$name");
                                    await GallerySaver.saveImage(photo.path);
                                    setState(() {
                                      selectedImage = photo;
                                    });
                                  }
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.photo_library),
                                title: Text("Galeria"),
                                onTap: () async {
                                  final XFile? image = await _picker.pickImage(
                                      source: ImageSource.gallery);
                                  if (image != null) {
                                    setState(() {
                                      selectedImage = image;
                                    });
                                  }
                                },
                              )
                            ],
                          );
                        });
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: TextFormField(
                    controller: nomeContato,
                    decoration: const InputDecoration(
                        labelText: "Nome do contato",
                        hintText: "Digite o nome do contato.",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0)))),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: TextFormField(
                    controller: numContato,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        labelText: "Número do contato",
                        hintText: "Digite o número do contato.",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0)))),
                  ),
                ),
                Container(
                  child: TextButton(
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        setState(() {
                          isLoading = true;
                        });

                        pathImage = selectedImage!.path;
                        await ContactRep.AddContact(
                            nomeContato.text, numContato.text, pathImage);

                        setState(() {
                          isLoading = false;
                        });

                        Navigator.pop(context);
                      },
                      child: Text(
                        "SALVAR",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                )
              ],
            ),
          ),
          if (isLoading)
            Container(
                color: Colors.black.withOpacity(0.4),
                child: Center(
                  child: CircularProgressIndicator(),
                )),
        ],
      ),
    );
  }
}
