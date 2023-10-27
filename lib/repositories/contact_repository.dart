import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lista_contatos/models/contact_model.dart';
import 'package:lista_contatos/pages/edit_contact.dart';

class ContactsRepository {
  String appId = (dotenv.env['APP_ID']).toString();
  String appKey = (dotenv.env['APP_KEY']).toString();
  String address = (dotenv.env['PARSE_ADDRESS']).toString();
  var dio = Dio();

  Future<ContactModel> get() async {
    dio.options.headers = {
      "X-Parse-Application-Id": appId,
      "X-Parse-REST-API-Key": appKey,
      "Content-Type": "application/json"
    };

    try {
      var result = await dio.get(address);
      return ContactModel.fromJson(result.data);
    } catch (e) {
      print("Erro: ${e}");
      throw e;
    }
  }

  Future<void> AddContact(
      String nome_contato, String num_contato, String path_imagem) async {
    dio.options.headers = {
      "X-Parse-Application-Id": appId,
      "X-Parse-REST-API-Key": appKey,
      "Content-Type": "application/json"
    };
    var dataSent = {
      "nome_contato": nome_contato,
      "numero_contato": num_contato,
      "imagem_contato": path_imagem
    };
    try {
      await dio.post(address, data: dataSent);
    } catch (e) {
      print("Erro: ${e}");
    }
  }

  Future<void> EditContact(
      String nome_contato, String num_contato, String contatoId) async {
    dio.options.headers = {
      "X-Parse-Application-Id": appId,
      "X-Parse-REST-API-Key": appKey,
      "Content-Type": "application/json"
    };
    String fullAdress = "$address/$contatoId";
    var dataSent = {
      "nome_contato": nome_contato,
      "numero_contato": num_contato,
    };
    try {
      await dio.put(fullAdress, data: dataSent);
      print(dataSent);

    } catch (e) {
      print("Erro: ${e}");
    }
  }
}
