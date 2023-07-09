import '../models/models.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:remove_diacritic/remove_diacritic.dart';

Future<List<Bioinsumo>> fetchBioinsumos() async {
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

    Bioinsumo bioinsumo = Bioinsumo(
      tipoFertilizante: item['tipoFertilizante'],
      naturezaFisica: item['naturezaFisica'],
      culturas: culturas,
      especie: item['especie'],
      razaoSocial: item['razaoSocial'],
      uf: item['uf'],
    );

    // Verifica se a cultura já existe na lista de bioinsumos
    bool culturaExists = bioinsumos.any(
        (b) => b.culturas.any((c) => c.nome == bioinsumo.culturas[0].nome));

    // Se a cultura ainda não existir, adiciona o bioinsumo à lista
    if (!culturaExists) {
      bioinsumos.add(bioinsumo);
    }
  });

  return bioinsumos;
}

Future<List<Bioinsumo>> buscarBioinsumosPorTipo(String tipo) async {
  // Chamada à API para buscar todos os bioinsumos
  List<Bioinsumo> bioinsumos = await fetchBioinsumos();

  // Converter as palavras-chave para sequências normalizadas sem acentos
  tipo = removeDiacritics(tipo);

  // Filtrar os bioinsumos pelo tipo de fertilizante e cultura
  List<Bioinsumo> bioinsumosFiltrados = bioinsumos
      .where((bioinsumo) =>
          bioinsumo.tipoFertilizante
              .toLowerCase()
              .contains(tipo.toLowerCase()) ||
          bioinsumo.razaoSocial.toLowerCase().contains(tipo.toLowerCase()) ||
          bioinsumo.culturas.any((culturaItem) =>
              culturaItem.nome.toLowerCase().contains(tipo.toLowerCase())))
      .toList();

  return bioinsumosFiltrados;
}
