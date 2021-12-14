import 'dart:convert';
import 'package:flutter/material.dart';
import 'home_api.dart';
import 'package:http/http.dart' as http;

class addNote extends StatelessWidget {
  TextEditingController _matkulController = TextEditingController();
  TextEditingController _kelasController = TextEditingController();
  TextEditingController _hariController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Future saveNote() async {
    final response =
        await http.post(Uri.parse("http://127.0.0.1:8000/api/notes"), body: {
      "matkul": _matkulController.text,
      "kelas": _kelasController.text,
      "hari": _kelasController.text,
    });
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add data page"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _matkulController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "masukkan nama matkul";
                }
              },
              decoration: InputDecoration(labelText: "Matkul"),
            ),
            TextFormField(
              controller: _kelasController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "masukkan nama kelas";
                }
              },
              decoration: InputDecoration(labelText: "Kelas"),
            ),
            TextFormField(
              controller: _hariController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "masukkan nama Hari";
                }
              },
              decoration: InputDecoration(labelText: "Hari"),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    saveNote().then((value) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HomeApi();
                      }));
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("Note Added")));
                    });
                  }
                },
                child: Text("SAVE"))
          ],
        ),
      ),
    );
  }
}
