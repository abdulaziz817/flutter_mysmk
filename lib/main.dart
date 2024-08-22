import 'package:flutter/material.dart';

import 'package:mysmk/detailhasilbelajar.dart';
import 'package:mysmk/hasilbelajar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
      ),
      home:HasilBelajarMatematika(),
      debugShowCheckedModeBanner: false,
    );
    
  }
}
