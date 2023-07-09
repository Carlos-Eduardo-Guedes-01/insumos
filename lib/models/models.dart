// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Bioinsumo {
  final String tipoFertilizante;
  final String naturezaFisica;
  final String especie;
  final String razaoSocial;
  final String uf;
  final List<Cultura> culturas;

  Bioinsumo({
    required this.tipoFertilizante,
    required this.naturezaFisica,
    required this.especie,
    required this.razaoSocial,
    required this.uf,
    required this.culturas,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tipoFertilizante': tipoFertilizante,
      'naturezaFisica': naturezaFisica,
      'especie': especie,
      'razaoSocial': razaoSocial,
      'uf': uf,
      'culturas': culturas.map((x) => x.toMap()).toList(),
    };
  }

  factory Bioinsumo.fromMap(Map<String, dynamic> map) {
    return Bioinsumo(
      tipoFertilizante: map['tipoFertilizante'] as String,
      naturezaFisica: map['naturezaFisica'] as String,
      especie: map['especie'] as String,
      razaoSocial: map['razaoSocial'] as String,
      uf: map['uf'] as String,
      culturas: List<Cultura>.from(
        (map['culturas'] as List<int>).map<Cultura>(
          (x) => Cultura.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Bioinsumo.fromJson(String source) =>
      Bioinsumo.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Cultura {
  final String nome;
  final String nomeCientifico;

  Cultura({
    required this.nome,
    required this.nomeCientifico,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'nomeCientifico': nomeCientifico,
    };
  }

  factory Cultura.fromMap(Map<String, dynamic> map) {
    return Cultura(
      nome: map['nome'] as String,
      nomeCientifico: map['nomeCientifico'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cultura.fromJson(String source) =>
      Cultura.fromMap(json.decode(source) as Map<String, dynamic>);
}
