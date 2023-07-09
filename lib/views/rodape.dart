import 'package:flutter/material.dart';

class RodaPe extends StatefulWidget {
  final int indiceAtual;

  RodaPe({Key? key, required this.indiceAtual}) : super(key: key);

  @override
  State<RodaPe> createState() => _RodaPeState();
}

class _RodaPeState extends State<RodaPe> {
  late int _indiceAtual;

  @override
  void initState() {
    super.initState();
    _indiceAtual = widget.indiceAtual;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.greenAccent[700],
      currentIndex: _indiceAtual,
      onTap: onTabTapped,
      iconSize: 50,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 40,
          ),
          label: 'Início',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            size: 40,
          ),
          label: 'Buscar',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            size: 40,
          ),
          label: 'Sobre',
        ),
      ],
      selectedItemColor:
          Color.fromARGB(255, 0, 71, 2), // Define a cor do item selecionado
      unselectedItemColor: Color.fromRGBO(
          255, 217, 195, 1), // Define a cor dos itens não selecionados
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamedAndRemoveUntil(
          context,
          'inicio',
          (Route<dynamic> route) => false,
        );
        break;
      case 1:
        Navigator.pushNamed(context, 'home');
        break;
      case 2:
        Navigator.pushNamed(context, 'sobre');
        break;
    }
  }
}
