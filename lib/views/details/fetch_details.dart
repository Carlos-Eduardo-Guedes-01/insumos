import 'dart:convert';
import 'package:flutter/services.dart';
import '../../models/models.dart';

Future<List<Bioinsumo>> fetchBioinsumos2(String nome) async {
  String jsonContent = await rootBundle.loadString('assets/dados.json');
  var data = jsonDecode(jsonContent);
  var bioinsumosData = data['data'] as List<dynamic>;

  List<Bioinsumo> bioinsumos = [];

  bioinsumosData.forEach((item) {
    var culturasData = item['culturas'] as List<dynamic>;
    List<Cultura> culturas = culturasData.map<Cultura>((cultura) {
      return Cultura(
        nome: cultura['cultura'],
        nomeCientifico: cultura['nomeCientifico'],
      );
    }).toList();

    // Verifica se a cultura é igual a nome
    bool isFeijao = culturas.any((c) => c.nome == nome);
    // Se for "FEIJÃO", adiciona o bioinsumo à lista
    if (isFeijao) {
      Bioinsumo bioinsumo = Bioinsumo(
        tipoFertilizante: item['tipoFertilizante'],
        naturezaFisica: item['naturezaFisica'],
        culturas: culturas,
        especie: item['especie'],
        razaoSocial: item['razaoSocial'],
        uf: item['uf'],
      );
      bioinsumos.add(bioinsumo);
    }
  });

  return bioinsumos;
}
