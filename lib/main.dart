import 'package:flutter/material.dart';
import 'app_constants.dart';
import 'home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI Check",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // textTheme: GoogleFonts.nunitoSansTextTheme(
        //   Theme.of(context).textTheme,
        // ),
      ),
      home: HomeScreen(),
    );
  }
}
