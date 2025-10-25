import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); //hello
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Example',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      routes: {
        '/details': (context) => DetailsPage(), // Маршрут к DetailsPage
      },
      home: HomePage(), // Стартовая страница
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('K-pop'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Навигация к DetailsPage через именованный маршрут
            Navigator.pushNamed(context, '/details');
          },
          child: Text('Enhypen'),
        ),
      ),
    );
  }
}

// Класс, на который ведет маршрут
class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EN-'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Engene'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Возврат
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}