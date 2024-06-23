import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  static const String routeName = '/add_screen'; // Define a static route name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Screen'),
      ),
      body: Center(
        child: Text('Add Screen Content'),
      ),
    );
  }
}
