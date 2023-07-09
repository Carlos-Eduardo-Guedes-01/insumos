import 'package:app_preservacao/models/models.dart';
import 'package:app_preservacao/screen/home_template.dart';
import 'package:flutter/material.dart';
import 'package:app_preservacao/api/api.dart' as API;
import '../views/rodape.dart' as RODAPE;

class ScreenHomePage extends StatefulWidget {
  const ScreenHomePage({super.key});
  static const routeName = 'home';

  @override
  State<ScreenHomePage> createState() => _ScreenHomePageState();
}

class _ScreenHomePageState extends State<ScreenHomePage> {
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
                  decoration: InputDecoration(
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
              icon: Icon(Icons.clear),
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
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 253, 233, 222),
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
                alteraAppBar(0);
              },
            ),
          ],
          backgroundColor: Colors.greenAccent[700],
        ),
        body: FutureBuilder<List<Bioinsumo>>(
          future: API.fetchBioinsumos(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Falha de conexão!'),
              );
            } else if (snapshot.hasData) {
              var bioinsumos = snapshot.data!;
              if (bioinsumos.isEmpty) {
                return const Center(
                  child: Text('Sem dados.'),
                );
              }
              return Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent:
                        260, // Reduza esse valor para diminuir o tamanho de cada item
                    crossAxisSpacing: 10,
                    childAspectRatio:
                        1.23, // Ajuste esse valor para alterar a proporção
                  ),
                  itemCount: bioinsumos.length,
                  itemBuilder: (context, index) {
                    final bioinsumo = bioinsumos[index];
                    Cultura cultura = bioinsumo.culturas[0];
                    return GestureDetector(
                      child: widget_cards(cultura.nome),
                      onTap: () {
                        Navigator.pushNamed(context, 'details',
                            arguments: {'nome': cultura.nome});
                      },
                    );
                  },
                ),
              );
            } else {
              return const Center(
                child: Text('Sem dados.'),
              );
            }
          },
        ),
        bottomNavigationBar: RODAPE.RodaPe(
          indiceAtual: 1,
        ));
  }
}
