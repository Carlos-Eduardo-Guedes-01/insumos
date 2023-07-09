// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../models/models.dart';
// ignore: library_prefixes
import '../api/api.dart' as API;

class SeachPage extends StatefulWidget {
  const SeachPage({Key? key});
  static const routeName = 'search';
  @override
  State<SeachPage> createState() => _SeachPageState();
}

class _SeachPageState extends State<SeachPage> {
  Widget titulo = const Image(
    image: AssetImage('assets/img/ICON_inoculantes.png'),
    width: 270,
  );
  void alteraAppBar(int cont) {
    if (cont == 0) {
      cont = 1;
      setState(() {
        titulo = Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: editingController,
                  onSubmitted: (value) {
                    Navigator.pushNamed(context, 'search',
                        arguments: {'bioinsumos': value});
                  },
                  decoration: const InputDecoration(
                    labelText: "Pesquisar",
                    hintText: "Pesquisar",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                alteraAppBar(1);
                setState(() {
                  editingController.clear();
                });
              },
            ),
          ],
        );
      });
    } else if (cont == 1) {
      titulo = const Image(
        image: AssetImage('assets/img/ICON_inoculantes.png'),
        width: 270,
      );
    }
  }

  TextEditingController editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 217, 195, 1),
      appBar: AppBar(
        toolbarHeight: 100,
        title: titulo,
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 30),
            icon: const Icon(
              Icons.search,
              color: Color.fromARGB(255, 18, 92, 0),
              size: 40,
            ),
            onPressed: () {
              alteraAppBar(0);
            },
          ),
        ],
        backgroundColor: Colors.greenAccent[700],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 0.9,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 1,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.6)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: double.maxFinite,
                      height: double.tryParse('950'),
                      child: FutureBuilder<List<Bioinsumo>>(
                        future: API.buscarBioinsumosPorTipo(args['bioinsumos']),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return const Center(
                              child: Text('Erro ao buscar os bioinsumos.'),
                            );
                          } else if (snapshot.hasData) {
                            List<Bioinsumo> bioinsumos = snapshot.data!;
                            return SizedBox(
                              height: 200,
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 800,
                                  crossAxisSpacing: 11,
                                  childAspectRatio: 1.6,
                                ),
                                scrollDirection: Axis.vertical,
                                itemCount: bioinsumos.length,
                                itemBuilder: (context, index) {
                                  Bioinsumo bioinsumo = bioinsumos[index];
                                  Cultura cultura = bioinsumo.culturas[0];
                                  return Container(
                                    width: double.maxFinite,
                                    height: 300,
                                    margin: const EdgeInsets.only(
                                        left: 10, right: 10, top: 18),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color.fromRGBO(
                                            102, 255, 0, 1),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: double.maxFinite,
                                          height: 60,
                                          padding: const EdgeInsets.only(
                                              top: 15, left: 15),
                                          decoration: const BoxDecoration(
                                            color: Color.fromRGBO(
                                                102, 255, 0, 0.548),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            ),
                                          ),
                                          child: Text(
                                            bioinsumos[index]
                                                .especie
                                                .toString(), // Ajuste aqui para acessar o atributo correto da especie
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, top: 10),
                                          child: Text(
                                            'Cultura:',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Text(
                                            cultura.nome,
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, top: 10),
                                          child: Text(
                                            'Tipo de Fertilizante:',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Text(
                                            bioinsumo.tipoFertilizante,
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, top: 10),
                                          child: Text(
                                            'Estado da Razão Social:',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Text(
                                            bioinsumo.uf,
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, top: 10),
                                          child: Text(
                                            'Razão Social:',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Text(
                                            '${bioinsumo.razaoSocial} - ${bioinsumo.uf}',
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            );
                          }
                          return const Text(
                              "Erro desconhecido, contate o suporte");
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
