import 'package:dam_u2_practica2_aplicacion_avanzada/taqueriadb.dart';
import 'package:flutter/material.dart';

class Pedir extends StatefulWidget {
  const Pedir({Key? key}) : super(key: key);

  @override
  State<Pedir> createState() => _Pedir();
}

class _Pedir extends State<Pedir> {
  DatabaseHelper dbHelper = DatabaseHelper();

  int NumeroTacos = 0;
  String MensajePedido = "";
  bool Cebolla = false;
  bool Cilantro = false;
  String seltaco = "";
  String ceb = "";
  String cil = "";
  List<String> tipotacos = <String>['Asada', 'Chorizo', 'Tripa', 'Adobada'];
  String primervalor = 'Asada';

  Future<void> Pedir() async {
    MensajePedido = "${NumeroTacos} Tacos de ${primervalor}";
    ceb="";
    cil="";
    if (Cebolla == true || Cilantro == true) {
      MensajePedido += " con";
    }
    if (Cilantro == true) {
      ceb = "Cebolla";
      MensajePedido += " Cebolla";
    }
    if (Cebolla == true) {
      cil = "Cilantro";
      MensajePedido += " Cilantro";
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Atendiendo:"),
            content: Text("Pidiendo: ${MensajePedido}"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("ok"))
            ],
          );
        });
    int id = await dbHelper.registrarpedido('$NumeroTacos', '$primervalor', '$ceb', '$cil');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("TACOS: ${NumeroTacos}",
            style: TextStyle(fontSize: 15, color: Colors.black)),
        SizedBox(
          height: 10,
          width: 10,
        ),
        Padding(
          padding: EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      NumeroTacos++;
                    });
                  },
                  icon: Icon(Icons.add)),
              SizedBox(
                height: 5,
                width: 30,
              ),
              IconButton(
                  onPressed: () {
                    if (NumeroTacos > 0) {
                      setState(() {
                        NumeroTacos--;
                      });
                    }
                  },
                  icon: Icon(Icons.remove)),
            ],
          ),
        ),
        DropdownButton<String>(
          value: primervalor,
          elevation: 16,
          onChanged: (String? value) {
            // This is called when the user selects an item.
            setState(() {
              primervalor = value!;
            });
          },
          items: tipotacos.map<DropdownMenuItem<String>>((String valor) {
            return DropdownMenuItem<String>(
              value: valor,
              child: Text(valor),
            );
          }).toList(),
        ),
        Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Cebolla"),
                  Checkbox(
                      value: Cebolla,
                      onChanged: (bool? estado) {
                        setState(() {
                          Cebolla = estado!;
                        });
                      })
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Cilantro"),
                  Checkbox(
                      value: Cilantro,
                      onChanged: (bool? estado) {
                        setState(() {
                          Cilantro = estado!;
                        });
                      })
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
          width: 10,
        ),
        ElevatedButton(
            onPressed: () {
              Pedir();
            },
            child: const Text("PEDIR")),
      ],
    );
  }
}
