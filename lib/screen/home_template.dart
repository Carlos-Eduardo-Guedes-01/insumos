import 'package:app_preservacao/views/case.dart';
import 'package:flutter/material.dart';

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
