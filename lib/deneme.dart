import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> _names = [
    'Liam', 'Noah', 'Oliver', 'William', 'Elijah', 
    'James', 'Benjamin', 'Lucas', 'Mason', 'Ethan', 'Alexander'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pop Menu with List'),
      ),
      body: ListView.builder(
        itemBuilder: (_, i) {
          String name = _names[i];
          return ListTile(
            leading: CircleAvatar(
              child: Text('${name[0]}'),
            ),
            title: Text('$name'),
          );
        },
        itemCount: _names.length,
      ),
    );
  }
}