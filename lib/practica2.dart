import 'package:flutter/material.dart';

import 'menu.dart';
import 'ordenes.dart';
import 'pedir.dart';

class Practica2 extends StatefulWidget {
  const Practica2({Key? key}) : super(key: key);

  @override
  State<Practica2> createState() => _Practica2State();
}

class _Practica2State extends State<Practica2> {

  int _indice = 0;

  void _cambiarindice (int indice){
    setState(() {
      _indice = indice;
    });
  }

  final List<Widget> _paginas = [
    Menu(),
    Pedir(),
    Ordenes(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("QUIERES TACOS?"),
        centerTitle: true,
      ),
      body: _paginas[_indice],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: "Menú",
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.paste),
            label: "Ordenar",
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.backup_table),
            label: "Pedidos",
            backgroundColor: Colors.grey,
          ),
        ],
        currentIndex: _indice,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.amber,
        onTap: _cambiarindice,
        iconSize: 30,
      ),
    );
  }
}
