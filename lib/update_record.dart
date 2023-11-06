import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class update_record extends StatefulWidget {
  String id_usuario;
  String name;
  String email;
  String password;
  update_record(this.id_usuario, this.name, this.email, this.password);

  @override
  State<update_record> createState() => _update_recordState();
}

class _update_recordState extends State<update_record> { 
  TextEditingController id_usuario = TextEditingController(); 
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController(); 
  TextEditingController password = TextEditingController(); 
  //Creacmos la funcion update record
//------------Actualizacion---
  Future<void> updaterecord() async {
    try {
      String uri = "http://localhost/ProjectVentas/update_record.php"; var res = await http.post(Uri.parse(uri), body: {
        "id_usuario": id_usuario.text,
        "name": name.text,
        "email": email.text,
        "password": password.text
      });

      var response = jsonDecode(res.body);
      if (response["success"] == "true") {
        print("Update");
      } else {
        print("No Update");
      }
    
    } catch (e) {
      print(e);
    }
  }

  //inicializar el estado 
  @override
  void initState() {
    id_usuario.text = widget.id_usuario;
    name.text = widget.name;
    email.text = widget.email;
    password.text = widget.password; 
    super.initState();
  }
  //-------interfaz de formlario
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      //home: Scaffold(
      appBar: AppBar(
        title: Text("ACTUALIZAR REGISTRO"),
      ),
      body: Column (children: [
        Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            controller: name,
            decoration: InputDecoration(
              border: OutlineInputBorder(), label: Text('Ingrese nombre')),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            controller: email,
            decoration: InputDecoration(
              border: OutlineInputBorder(), label: Text('Ingrese el email')),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            controller: password,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Ingrese el pasword')),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {
              updaterecord();
              //Navigator.pop(context);
            },
            child: Text('Actualizar'),
          ),
        )
      ]),
    );
  }
}