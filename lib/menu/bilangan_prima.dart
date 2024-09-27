import 'package:flutter/material.dart';
import 'dart:math';

class BilanganPrimaPage extends StatefulWidget {
  @override
  _BilanganPrimaPageState createState() => _BilanganPrimaPageState();
}

class _BilanganPrimaPageState extends State<BilanganPrimaPage> {
  final TextEditingController numberController = TextEditingController();
  List<int> prima = [];

  bool isPrime(int num) {
    if (num < 2) return false;
    for (int i = 2; i <= sqrt(num).toInt(); i++) {
      if (num % i == 0) return false;
    }
    return true;
  }

  void generatePrima() {
    int maxNum = int.parse(numberController.text);
    List<int> result = [];
    for (int i = 2; i <= maxNum; i++) {
      if (isPrime(i)) {
        result.add(i);
      }
    }
    setState(() {
      prima = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bilangan Prima'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: numberController,
              decoration: InputDecoration(labelText: 'Batas Bilangan'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: generatePrima,
              child: Text('Tampilkan Bilangan Prima'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('No')),
                    DataColumn(label: Text('Bilangan Prima')),
                  ],
                  rows: List<DataRow>.generate(prima.length, (index) {
                    return DataRow(cells: [
                      DataCell(Text('${index + 1}')),
                      DataCell(Text('${prima[index]}')),
                    ]);
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
