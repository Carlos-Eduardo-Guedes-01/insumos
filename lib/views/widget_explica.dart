import 'package:flutter/material.dart';

widget_explica(String texto1, String texto2, String texto3) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
    child: RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 18, color: Colors.black),
        children: [
          TextSpan(text: texto1),
          TextSpan(
            text: texto2,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: texto3,
          ),
        ],
      ),
    ),
  );
}
