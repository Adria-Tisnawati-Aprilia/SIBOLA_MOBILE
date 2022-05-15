import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sibola/auth/login.dart';
import 'package:sibola/screens/add_arena.dart';
import 'package:sibola/screens/arena_detail.dart';
import 'package:sibola/screens/edit_arena.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String? url = 'http://172.20.10.2:8000/api/arena/';

  //android emulator http://10.0.2.2
  Future<List<dynamic>> getArena() async {
    var response = await http.get(Uri.parse(url!));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  Future deleteArena(String arena) async {
    String url = "http://172.20.10.2:8000/api/arena/" + arena;

    var response = await http.delete(Uri.parse(url));
    //return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddArena()));
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text('SIBOLA'),
        ),
        body: FutureBuilder(
            future: getArena(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, int index) {
                      return Container(
                        height: 180,
                        child: Card(
                          elevation: 5,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ArenaDetail(
                                                arena: snapshot.data[index],
                                              )));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  height: 120,
                                  width: 120,
                                  child: Image.asset(
                                    "assets/images/arena1.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          snapshot.data[index]['kode_arena'],
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child:
                                            Text(snapshot.data[index]['nama_arena']),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(children: [
                                            GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              EditArena(
                                                                arena: snapshot
                                                                        .data[
                                                                    index],
                                                              )));
                                                },
                                                child: Icon(Icons.edit)),
                                            GestureDetector(
                                                onTap: () {
                                                  deleteArena(snapshot
                                                          .data[index]['kode_arena'])
                                                      .then((value) {
                                                    setState(() {});
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            content: Text(
                                                                "Produk berhasil di hapus")));
                                                  });
                                                },
                                                child: Icon(Icons.delete)),
                                          ]),
                                          Text(snapshot.data[index]['alamat']
                                              .toString())
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return Text('Data ERROR');
              }
            }));
  }
}