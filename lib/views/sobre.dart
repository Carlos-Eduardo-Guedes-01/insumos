import '../views/rodape.dart';
import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  static const routeName = 'sobre';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 217, 195, 1),
        appBar: AppBar(
          title: Text('Sobre'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bem-vindo(a) ao nosso aplicativo!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Este aplicativo foi desenvolvido como trabalho final da disciplina de Programação para Dispositivos Móveis pelo Instituto Federal do Piauí.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Nosso objetivo é proporcionar uma experiência fácil e intuitiva para você explorar informações sobre o setor agrícola.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Com o nosso aplicativo, você terá acesso a dados sobre bioinsumos, incluindo informações sobre tipos de fertilizantes, espécies de plantas, culturas recomendadas e muito mais.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Esperamos que você aproveite o nosso aplicativo e encontre informações úteis para suas atividades agrícolas.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Agradecemos por utilizar nosso aplicativo!',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),
              Center(
                child:
                    Text('Aluno Responsável: ', style: TextStyle(fontSize: 20)),
              ),
              Center(
                child: Transform.rotate(
                  angle: -42 * 0.0174533, // ângulo em radianos (45 graus)
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(500)),
                      image: DecorationImage(
                        image: AssetImage('assets/img/aluno.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: RodaPe(indiceAtual: 2));
  }
}
