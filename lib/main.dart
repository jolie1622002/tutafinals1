import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/screens/register_screen.dart';
import 'package:flutter_application_1/screens/addDocument.dart';
import 'package:flutter_application_1/screens/add_screen.dart';
import 'package:flutter_application_1/screens/start_screen.dart';
import 'package:flutter_application_1/screens/addMedicineScreen.dart';

void main() {
  runApp(ZEE());
}

class ZEE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'LoginScreen': (context) => LoginScreen(),
        'RegisterScreen': (context) => RegisterScreen(),
        'StartScreen': (context) => StartScreen(),
        AddScreen.routeName: (context) => AddScreen(),
        'AddDocument': (context) => AddDocument(),
        AddMedicineScreen.routeName: (context) => AddMedicineScreen(),
      },
      initialRoute: 'StartScreen',
    );
  }
}
