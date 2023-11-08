import 'dart:convert';
import 'package:appventas/update_record.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ViewData extends StatefulWidget {
  ViewData({Key? key}) : super(key: key);

  @override
  _ViewDataState createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  List userData = [];

  Future<void> getRecords() async {
    String uri = "http://localhost/ProjectVentas/view_data.php";

    try {
      var response = await http.get(Uri.parse(uri));
      print(response); // Imprimimos la respuesta completa en la consola
      setState(() {
        userData = jsonDecode(response.body);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getRecords();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Usuarios Registrados",
          style: TextStyle(
            fontSize: 24, // Tamaño de fuente
            fontWeight: FontWeight.bold, // Negrita
            color: Colors.black, // Color de texto
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: userData.length,
        itemBuilder: (context, index) {
          // Usando Card para mostrar los datos
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.blue,
              ), // Agregamos un icono de persona con color azul
              title: Text(
                userData[index]["name"],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                userData[index]["email"],
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      delrecord(userData[index]["id_usuario"]);
                      getRecords();
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Color.fromARGB(255, 46, 86, 155),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => update_record(
                            userData[index]["id_usuario"],
                            userData[index]["name"],
                            userData[index]["email"],
                            userData[index]["password"],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> delrecord(String id) async {
    try {
      String uri = "http://localhost/ProjectVentas/delete_record.php";
      var res = await http.post(Uri.parse(uri), body: {"id": id});
      var response = jsonDecode(res.body);
      if (response["success"] == "true") {
        print("Registro borrado");
      } else {
        print("Algun problema"); // some issue
      }
    } catch (e) {
      print(e);
    }
  }
}
