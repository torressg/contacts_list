class ContactModel {
  List<Contacts> results = [];

  ContactModel(this.results);

  ContactModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Contacts>[];
      json['results'].forEach((v) {
        results.add(Contacts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = results.map((v) => v.toJson()).toList();
    return data;
  }
}

class Contacts {
  String objectId = "";
  String nomeContato = "";
  String imagemContato = "";
  String numeroContato = "";
  String createdAt = "";
  String updatedAt = "";

  Contacts(
      {required this.objectId,
      required this.nomeContato,
      required this.imagemContato,
      required this.numeroContato,
      required this.createdAt,
      required this.updatedAt});

  Contacts.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    nomeContato = json['nome_contato'];
    imagemContato = json['imagem_contato'];
    numeroContato = json['numero_contato'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['nome_contato'] = nomeContato;
    data['imagem_contato'] = imagemContato;
    data['numero_contato'] = numeroContato;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}