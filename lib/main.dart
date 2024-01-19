import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.blueGrey,
              accentColor: Colors.blueGrey)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int answer = 0;
  int num1 = 0;
  int num2 = 0;
  String operation = "";

  void calculate() {
    switch (operation) {
      case "+":
        setState(() {
          answer = num1 + num2;
        });
        break;
      case "-":
        setState(() {
          answer = num1 - num2;
        });
        break;
      case "*":
        setState(() {
          answer = num1 * num2;
        });
        break;
      case "/":
        setState(() {
          answer = num1 ~/ num2;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculate"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Введите число",
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        num1 = int.tryParse(value) ?? 0;
                      });
                    },
                    onSubmitted: (value) {
                      calculate();
                    },
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Введите число",
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        num2 = int.tryParse(value) ?? 0;
                      });
                    },
                    onSubmitted: (value) {
                      calculate();
                    },
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Enter an operation (+, -, *, /)",
                    ),
                    onChanged: (value) {
                      setState(() {
                        operation = value;
                      });
                    },
                    onSubmitted: (value) {
                      calculate();
                    },
                  ),
                  Padding(padding: EdgeInsets.only(top: 50),child :Text(
                    "Ответ: ${answer}",
                    style: TextStyle(fontSize: 24),
                  ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}