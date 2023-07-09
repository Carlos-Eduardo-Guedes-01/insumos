import 'package:app_preservacao/views/widget_explica.dart';
import 'package:flutter/material.dart';
import '../views/rodape.dart' as RODAPE;

class PrimaryPage extends StatefulWidget {
  static const routeName = 'inicio';

  @override
  _PrimaryPageState createState() => _PrimaryPageState();
}

class _PrimaryPageState extends State<PrimaryPage> {
  @override
  Widget build(BuildContext context) {
    Widget titulo = const Image(
      image: AssetImage('assets/img/ICON_inoculantes.png'),
      width: 270,
    );
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 217, 195, 1),
      appBar: AppBar(
        toolbarHeight: 100,
        title: titulo,
        backgroundColor: Colors.greenAccent[700],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "Bem vindo ao nosso",
                    style: TextStyle(fontSize: 21),
                  ),
                ),
              ),
              Center(
                child: Container(
                  child: Text(
                    'aplicativo Agrícola!',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(23, 80, 54, 1)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                child: Text(
                  'Este aplicativo te ajudará a escolher inoculantes agrícolas para suas plantações com base na agroapi, fornecidos pela embrapa',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              widget_explica('1. Em ', "'Buscar' ",
                  'você poderá fazer sua busca por tipo de inoculante, cultura ou empresa, basta digitar na barra de pesquisa, você verá também uma tela com inoculantes para cada cultura!'),
              widget_explica('2. Em ', "'Início' ",
                  'você poderá voltar a página inicial do aplicativo!'),
              widget_explica('3. Em ', "'Sobre' ",
                  'você poderá ver descrições do aplicativo, quem fez, motivo, instituição, etc!'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: RODAPE.RodaPe(
        indiceAtual: 0,
      ),
    );
  }
}
