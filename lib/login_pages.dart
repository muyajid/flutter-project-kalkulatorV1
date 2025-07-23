import 'package:flutter/material.dart';
import 'package:flutter_calculator_project/kalkulator_pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void login() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Username dan Password dibutuhkan",
            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
          ),
          backgroundColor: Colors.yellowAccent,
          duration: Duration(seconds: 1),
        ),
      );
      return;
    }

    if (username == "admin" && password == "admin123") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Berhasil Login"),
          backgroundColor: Colors.greenAccent,
          duration: Duration(seconds: 1),
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => KalkulatorPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Gagal Login"),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Center().alignment,
              margin: EdgeInsets.only(top: 25, bottom: 35),
              child: Image.asset('asset/image.png', width: 200),
            ),
            Text(
              "Welcome Back",
              style: TextStyle(
                color: Colors.greenAccent,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Please Input Username And Password",
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 12.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25, bottom: 15),
              width: 300,
              height: 60,
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Username",
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 35),
              width: 300,
              height: 60,
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () => {login()},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                foregroundColor: Colors.white,
                fixedSize: Size(300, 55),
              ),
              child: Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
