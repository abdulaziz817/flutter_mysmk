import 'package:flutter/material.dart';

import 'package:mysmk/detailhasilbelajar.dart';
import 'package:mysmk/hasilbelajar.dart';
import 'package:mysmk/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MYSMK',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
       
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/hasilbelajar': (context) => HasilBelajar(), // Ganti dengan nama halaman utama Anda
      },
    );
  }
}