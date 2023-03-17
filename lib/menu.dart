import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _Menu();
}

class _Menu extends State<Menu> {

  int i = 0;
  List<String> Taco = ['Adobada', 'Chorizo', 'Tripa', 'Adobada'];

  void Siguiente() {
    if (i == 3) {
      setState(() {
        i = 0;
      });
    } else {
      setState(() {
        i++;
      });
    }
  }

  void Anterior() {
    if (i == 0) {
      setState(() {
        i = 3;
      });
    } else {
      setState(() {
        i--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: const Text(
            "(C) Reservados Taqueria el Cuate",
            style: TextStyle(fontSize: 20, color: Colors.red),
          )),
          Center(
              child: const Text(
            "MENÚ",
            style: TextStyle(fontSize: 30, color: Colors.red),
          )),
          SizedBox(
            height: 20,
            width: 10,
          ),
          Center(
            child: Image.asset(
              '/images/${Taco[i]}.jpg',
              height: 200,
              width: 200,
            )
          ),
          SizedBox(
            height: 10,
            width: 10,
          ),
          Center(
            child: Text(
              "Tacos de ${Taco[i]}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
            width: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child:
                    ElevatedButton(onPressed: () {
                      Anterior();
                    }, child: Text("Anterior")),
              ),
              SizedBox(
                height: 20,
                width: 10,
              ),
              Center(
                child:
                    ElevatedButton(onPressed: () {
                      Siguiente();
                    }, child: Text("Siguente")),
              ),
            ],
          )
        ],
      ),
    );
  }
}
