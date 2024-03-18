import 'package:flutter/material.dart';
import 'detail_disease.dart';
import 'disease_data.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Plant Diseases'),
        backgroundColor: Colors.greenAccent,
      ),
      body: GridView.builder(
        itemCount: listDisease.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailDS(disease: listDisease[index]),
                ),
              );
            },
            child: Card(
              child: Expanded( // Wrap the Column with Expanded
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 100.0, // Tinggi gambar
                      child: Image.network(listDisease[index].imgUrls),
                    ),
                    Container(
                      height: 20.0, // Tinggi teks
                      child: Text(
                        listDisease[index].name,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
