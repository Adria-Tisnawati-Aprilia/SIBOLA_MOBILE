import 'package:flutter/material.dart';

class ArenaDetail extends StatelessWidget {
  final Map arena;

  ArenaDetail({required this.arena});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Author Detail"),
      ),
      body: Column(
        children: [
          Container(
            child: Image.asset(
              "assets/img/buah.jpeg",
              width: 300,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  arena['email'],
                  style: TextStyle(fontSize: 22),
                ),
                Row(
                  children: [Icon(Icons.edit), Icon(Icons.delete)],
                )
              ],
            ),
          ),
          Text(arena['github']),
        ],
      ),
    );
  }
}
