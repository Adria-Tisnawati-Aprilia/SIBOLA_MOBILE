import 'dart:convert';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:http/http.dart' as http;

class  AddArena extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _kodeController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();
  
  Future saveArena() async {
    final response = 
      await http.post(Uri.parse("http://172.20.10.2:8000/api/arena"), body: {
        "kode_arena": _kodeController.text.toString(),
        "id_users": _idController.text.toString(),
        "nama_arena": _namaController.text.toString(),
        "alamat": _alamatController.text.toString()});
      
  print(response.body);
  
    return json.decode(response.body);
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Arena"),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _kodeController,
                decoration: InputDecoration(labelText: "Kode Arena"),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Please enter kode arena";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _idController,
                decoration: InputDecoration(labelText: "Id Users"),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Please enter id users";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(labelText: "Nama Arena"),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Please enter nama arena";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _alamatController,
                decoration: InputDecoration(labelText: "Alamat"),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Please enter alamat";
                  }
                  return null;
                },
              ),
              SizedBox(
                height:20,
              ),
              ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    saveArena().then((value) {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Produk berhasil di tambah"),
                          ));
                    });
                  }
                }, 
                child: Text("Save"))
            ],
          ),
        )
    );
  }
}