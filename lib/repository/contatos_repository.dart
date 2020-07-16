

import 'package:flutter_dio_com_node/model/contato_model.dart';
import 'package:flutter_dio_com_node/utils/custom_dio.dart';

class ContatosRepository {
  Future<List<ContatoModel>> findAll() {
    var dio = CustomDio.withAuthentication().instance;
    return dio.get('http://localhost:3000/contatos').then((res) {
      return res.data.map<ContatoModel>((c) => ContatoModel.fromMap(c)).toList()
      as List<ContatoModel>;
    }).catchError((err) => print(err));
  }

  Future<List<ContatoModel>> findFilter(String nome) {
    var dio = CustomDio.withAuthentication().instance;
    return dio
        .get('http://localhost:3000/contatos/filtrar?nome=$nome')
        .then((res) {
      return res.data.map<ContatoModel>((c) => ContatoModel.fromMap(c)).toList()
      as List<ContatoModel>;
    });
  }
}