import 'package:flutter/material.dart';

class LayangLayangPage extends StatefulWidget {
  @override
  _LayangLayangPageState createState() => _LayangLayangPageState();
}

class _LayangLayangPageState extends State<LayangLayangPage> {
  final TextEditingController diagonal1Controller = TextEditingController();
  final TextEditingController diagonal2Controller = TextEditingController();
  double luas = 0;
  double keliling = 0;

  void hitungLayangLayang() {
    double diagonal1 = double.parse(diagonal1Controller.text);
    double diagonal2 = double.parse(diagonal2Controller.text);

    setState(() {
      luas = 0.5 * diagonal1 * diagonal2;
      keliling = 2 * (diagonal1 + diagonal2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layang-layang'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: diagonal1Controller,
              decoration: InputDecoration(labelText: 'Diagonal 1'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextField(
              controller: diagonal2Controller,
              decoration: InputDecoration(labelText: 'Diagonal 2'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: hitungLayangLayang,
              child: Text('Hitung'),
            ),
            Text('Luas: $luas'),
            Text('Keliling: $keliling'),
            SizedBox(height: 16)
          ],
        ),
      ),
    );
  }
}
