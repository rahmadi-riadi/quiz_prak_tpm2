import 'package:flutter/material.dart';
import 'disease_data.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailDS extends StatefulWidget {
  final Diseases disease;

  DetailDS({required this.disease});

  @override
  _DetailDSState createState() => _DetailDSState();
}

class _DetailDSState extends State<DetailDS> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Detail Diseases'),
        backgroundColor: Colors.greenAccent,
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: isFavorite
                  ? Colors.red
                  : Colors.grey, // Warna berubah menjadi  saat favorit
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite; // Ubah status favorit saat ditekan
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(isFavorite
                      ? 'DITAMBAHKAN KE FAVORIT'
                      : 'DIHAPUS DARI FAVORIT'),
                  backgroundColor: isFavorite
                      ? Colors.red
                      : Colors
                          .green, // Warna berubah menjadi merah saat ditambahkan ke favorit dan hijau saat dihapus dari favorit
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.network(widget.disease.imgUrls)),
            Text('Disease Name',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            Text(widget.disease.name, textAlign: TextAlign.center),
            Text('Plant Name',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            Text(widget.disease.plantName, textAlign: TextAlign.center),
            Text('Ciri-ciri',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            ...widget.disease.nutshell
                .map((item) => Text(item, textAlign: TextAlign.center))
                .toList(),
            Text('Disease ID',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            Text(widget.disease.id, textAlign: TextAlign.center),
            Text('Symptom',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            Text(widget.disease.symptom, textAlign: TextAlign.center),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.pageview),
        backgroundColor: Colors.greenAccent,
        onPressed: () async {
          if (await canLaunch(widget.disease.imgUrls)) {
            await launch(widget.disease.imgUrls);
          } else {
            throw 'tidak bisa menampilkan ${widget.disease.imgUrls}';
          }
        },
      ),
    );

  }
}
