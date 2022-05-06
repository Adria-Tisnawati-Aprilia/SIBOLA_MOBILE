import 'dart:convert';

import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:http/http.dart' as http;

class EditArena extends StatelessWidget {
  final Map arena;

  EditArena({required this.arena});
  final _formKey = GlobalKey<FormState>();
  TextEditingController _kodeController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();
  Future updateArena() async {
    final response = await http.put(
        Uri.parse("http://172.20.10.2:8000/api/arena/" +
            arena['kode_arena'].toString()),
        body: {
          "kode_arena": _kodeController.text.toString(),
          "id_users": _idController.text.toString(),
          "nama_arena": _namaController.text.toString(),
          "alamat": _alamatController.text.toString(),
        });

    print(response.body);

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Arena"),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _kodeController..text = arena['kode_arena'],
                decoration: InputDecoration(labelText: "Kode Arena"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Kode Arena";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _idController..text = arena['id_users'],
                decoration: InputDecoration(labelText: "Id Arena"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Id Arena";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _namaController..text = arena['nama_arena'],
                decoration: InputDecoration(labelText: "Nama Arena"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Nama Arena";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _alamatController..text = arena['alamat'],
                decoration: InputDecoration(labelText: "Alamat"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Alamat";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      updateArena().then((value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Produk berhasil di ubah"),
                        ));
                      });
                    }
                  },
                  child: Text("Update"))
            ],
          ),
        ));
  }
}
