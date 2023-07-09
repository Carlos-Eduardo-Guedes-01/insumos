import 'package:app_preservacao/models/models.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

Future<List<Bioinsumo>> fetchBioinsumos() async {
  String jsonContent = await rootBundle.loadString('assets/dados.json');
  var data = jsonDecode(jsonContent);
  var bioinsumosData = data['data'] as List<dynamic>;

  List<Bioinsumo> bioinsumos =
      bioinsumosData.map((item) => Bioinsumo.fromMap(item)).toList();

  return bioinsumos;
}
