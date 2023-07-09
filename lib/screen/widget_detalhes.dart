import 'package:flutter/material.dart';

widget_detalhes(var args, String tipo_fert, String nat_fisic, String especie) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.3),
          borderRadius: BorderRadius.circular(20),
        ),
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
      Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 18),
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(102, 255, 0, 1), width: 2),
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
              padding: EdgeInsets.only(
                top: 5,
                left: 15,
              ),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(102, 255, 0, 0.548),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Text(
                tipo_fert,
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    'Culturas:',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold),
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
                margin: EdgeInsets.only(right: 5, left: 5),
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)))),
              ),
            ),
            Row(
              children: [
                Container(
                  width: 470,
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Natureza Física: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(nat_fisic),
                ),
              ],
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(right: 5, left: 5),
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)))),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(),
              child: Row(
                children: [
                  Text(
                    'Espécie:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [Text(especie)],
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    ],
  );
}
