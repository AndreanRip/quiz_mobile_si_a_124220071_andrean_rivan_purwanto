import 'package:flutter/material.dart';

class TrapesiumPage extends StatefulWidget {
  @override
  _TrapesiumPageState createState() => _TrapesiumPageState();
}

class _TrapesiumPageState extends State<TrapesiumPage> {
  final TextEditingController alas1Controller = TextEditingController();
  final TextEditingController alas2Controller = TextEditingController();
  final TextEditingController tinggiController = TextEditingController();
  double luas = 0;
  double keliling = 0;

  void hitungTrapesium() {
    double alas1 = double.parse(alas1Controller.text);
    double alas2 = double.parse(alas2Controller.text);
    double tinggi = double.parse(tinggiController.text);

    setState(() {
      luas = 0.5 * (alas1 + alas2) * tinggi;
      keliling = alas1 + alas2 + 2 * tinggi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trapesium'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: alas1Controller,
              decoration: InputDecoration(labelText: 'Alas 1'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: alas2Controller,
              decoration: InputDecoration(labelText: 'Alas 2'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: tinggiController,
              decoration: InputDecoration(labelText: 'Tinggi'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: hitungTrapesium,
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
