import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

//добавить виджеты Container, networkimage, circleAvatar,
//св-ва style у  Text, decoration у Container
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Column(
          children:[
          Text('Hello World!'),
          Text('Hello World!'),
          Text('Hello World!'),
          Text('Hello World!'),
          Text('Hello World!'),
          ]
        ),
      ),
    );
  }
}
