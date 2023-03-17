import 'package:dam_u2_practica2_aplicacion_avanzada/taqueriadb.dart';
import 'package:flutter/material.dart';

class Ordenes extends StatefulWidget {
  const Ordenes({Key? key}) : super(key: key);

  @override
  State<Ordenes> createState() => _Ordenes();
}

class _Ordenes extends State<Ordenes> {
  DatabaseHelper dbHelper = DatabaseHelper();
  String Pedidos = "";

  Future<void> mostarpedidos() async {
    List<Map<String, dynamic>> dbpedidos = await dbHelper.obtenerpedidos();
    Pedidos = "";
    for (int i = 0; i < dbpedidos.length; i++) {
      Pedidos +=
          "Pedido #${dbpedidos[i]['NumPedido']}: ${dbpedidos[i]['Cantidad']} Tacos de ${dbpedidos[i]['Tipo']} ${dbpedidos[i]['Cebolla']} ${dbpedidos[i]['Cilantro']} \n";
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(30),
      children: [
        ElevatedButton(
            onPressed: () {
              setState(() {
                mostarpedidos();
              });
            },
            child: const Text(
              "Pedidos Anteriores:",
              style: TextStyle(fontSize: 30, color: Colors.red),
            )),
        Text("\n${Pedidos}", style: TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}
