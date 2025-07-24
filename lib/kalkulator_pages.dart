import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  final TextEditingController _numberOneControl = TextEditingController();
  final TextEditingController _numberTwoControl = TextEditingController();
  double hasil = 0;
  void clearInput() {
    _numberOneControl.clear();
    _numberTwoControl.clear();
    setState(() {
      hasil = 0;
    });
  }

  void calculate(String ops) {
    double angka1 = double.parse(_numberOneControl.text.trim());
    double angka2 = double.parse(_numberTwoControl.text.trim());

    setState(() {
      switch (ops) {
        case "+":
          hasil = angka1 + angka2;
          break;
        case "-":
          hasil = angka1 - angka2;
          break;
        case "*":
          hasil = angka1 * angka2;
          break;
        case ":":
          if (angka1 == 0 || angka2 == 0) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Tidak dapat membagi dengan angka 0",
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.yellowAccent,
              ),
            );
            clearInput();
            return;
          }
          hasil = angka1 / angka2;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kalkulator Pages"),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(
        alignment: Center().alignment,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50, bottom: 15),
              width: 300,
              height: 60,
              child: TextField(
                controller: _numberOneControl,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "number 1",
                ),
              ),
            ),
            // ignore: sized_box_for_whitespace
            Container(
              margin: EdgeInsets.only(bottom: 15),
              width: 300,
              height: 60,
              child: TextField(
                controller: _numberTwoControl,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "number 2",
                ),
              ),
            ),
            Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => {calculate("+")},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    foregroundColor: Colors.white,
                    fixedSize: Size(125, 50),
                  ),
                  child: Text(
                    "+",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => {calculate("*")},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    foregroundColor: Colors.white,
                    fixedSize: Size(125, 50),
                  ),
                  child: Text(
                    "X",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => {calculate("-")},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    foregroundColor: Colors.white,
                    fixedSize: Size(125, 50),
                  ),
                  child: Text(
                    "-",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => {calculate(":")},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    foregroundColor: Colors.white,
                    fixedSize: Size(125, 50),
                  ),
                  child: Text(
                    ":",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                'Hasil = $hasil',
                style: TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => {clearInput()},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                foregroundColor: Colors.white,
                fixedSize: Size(250, 50),
              ),
              child: Text(
                "Clear",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
