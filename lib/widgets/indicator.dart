import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  const Indicator({Key? key, required this.title, required this.qtd, required this.bgColor}) : super(key: key);

  final String title;
  final String qtd;
  final Color bgColor;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      width: 190,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 25),
      child: Column(
        children: [
          Text(style: const TextStyle(color: Colors.black, fontSize: 28), title),
          const SizedBox(height: 10),
          Text(style: const TextStyle(color: Colors.black, fontSize: 40), qtd)
        ],)
    );
  }
}