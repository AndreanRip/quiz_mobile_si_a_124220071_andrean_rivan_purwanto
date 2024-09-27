import 'package:flutter/material.dart';
import 'dart:math';

class LingkaranPage extends StatefulWidget {
  @override
  _LingkaranPageState createState() => _LingkaranPageState();
}

class _LingkaranPageState extends State<LingkaranPage> {
  final TextEditingController radiusController = TextEditingController();
  double luas = 0;
  double keliling = 0;

  void hitungLingkaran() {
    double radius = double.parse(radiusController.text);

    setState(() {
      luas = pi * pow(radius, 2);
      keliling = 2 * pi * radius;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lingkaran'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: radiusController,
              decoration: InputDecoration(labelText: 'Radius'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: hitungLingkaran,
              child: Text('Hitung'),
            ),
            Text('Luas: $luas'),
            Text('Keliling: $keliling'),
          ],
        ),
      ),
    );
  }
}
