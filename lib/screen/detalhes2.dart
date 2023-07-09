import '../models/models.dart';
import 'package:flutter/material.dart';
import '../views/case.dart';
import '../views/details/fetch_details.dart';

class DetalheProduto extends StatefulWidget {
  static const routeName = 'details';
  const DetalheProduto({Key? key}) : super(key: key);

  @override
  State<DetalheProduto> createState() => _DetalheProdutoState();
}

class _DetalheProdutoState extends State<DetalheProduto> {
  Widget titulo = const Image(
    image: AssetImage('assets/img/ICON_inoculantes.png'),
    width: 270,
  );
  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context)!.settings.arguments as Map;
    var img = widget_decisao(args['nome']);
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 217, 195, 1),
      appBar: AppBar(
        toolbarHeight: 100,
        title: titulo,
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 30),
            icon: Icon(
              Icons.search,
              color: Color.fromARGB(255, 18, 92, 0),
              size: 40,
            ),
            onPressed: () {
              setState(() {
                ;
              });
            },
          ),
        ],
        backgroundColor: Colors.greenAccent[700],
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration:
                BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.6)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                  width: double.maxFinite,
                  height: 260,
                  decoration: BoxDecoration(
                    //border: Border.all(color: Color.fromRGBO(175, 249, 163, 1)),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          width: 600,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(img), fit: BoxFit.fill),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 0.3),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, bottom: 20),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          args['nome'],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 680,
                  child: FutureBuilder<List<Bioinsumo>>(
                    future: buscarBioinsumosPorCultura(args['nome']),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Erro ao buscar os bioinsumos.'),
                        );
                      } else if (snapshot.hasData) {
                        List<Bioinsumo> bioinsumos = snapshot.data!;
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent:
                                      550, // Reduza esse valor para diminuir o tamanho de cada item
                                  crossAxisSpacing: 0.1,
                                  childAspectRatio:
                                      2 // Ajuste esse valor para alterar a proporção
                                  ),
                          scrollDirection: Axis.vertical,
                          itemCount: bioinsumos.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: double.maxFinite,
                              margin:
                                  EdgeInsets.only(left: 10, right: 10, top: 18),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromRGBO(102, 255, 0, 1),
                                    width: 2),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: Wrap(
                                spacing: 0,
                                children: [
                                  Container(
                                    width: double.maxFinite,
                                    height: 60,
                                    padding: EdgeInsets.only(
                                      top: 15,
                                      left: 15,
                                    ),
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromRGBO(102, 255, 0, 0.548),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                    child: Text(
                                      bioinsumos[index].especie,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 10, top: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Cultura:',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Row(
                                      children: [Text(args['nome'])],
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          right: 5,
                                          left: 5,
                                          bottom: 10,
                                          top: 10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.1)))),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 470,
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          'Natureza Física: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Text(
                                            bioinsumos[index].naturezaFisica),
                                      ),
                                    ],
                                  ),
                                  Center(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          right: 5,
                                          left: 5,
                                          bottom: 10,
                                          top: 10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.1)))),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Espécie:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Row(
                                      children: [
                                        Text(bioinsumos[index].especie)
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                      return Container(
                        child: Text("Erro desconhecido, contate o suporte"),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<List<Bioinsumo>> buscarBioinsumosPorCultura(String cultura2) async {
    // Chamada à API para buscar os bioinsumos por cultura
    List<Bioinsumo> bioinsumos = await fetchBioinsumos2(cultura2);

    // Filtrar os bioinsumos pela cultura desejada
    List<Bioinsumo> bioinsumosFiltrados = bioinsumos
        .where((bioinsumo) =>
            bioinsumo.culturas.any((cultura) => cultura.nome == cultura2))
        .toList();

    return bioinsumosFiltrados;
  }
}

Widget widget_cards(String titulo) {
  final String img = widget_decisao(titulo);
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 97, 172, 85)),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: const Color.fromRGBO(222, 248, 219, 1),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 200,
                    height: 105,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: AssetImage(img),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 110),
                  child: Container(
                    child: ListTile(
                      title: Text(
                        titulo,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Mais informações >>',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
