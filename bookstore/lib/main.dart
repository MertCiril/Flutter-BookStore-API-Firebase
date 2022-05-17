import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:kayip/home.dart';

import 'kitap.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();//firebase başlatıyor bu iki satır
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Material App',debugShowCheckedModeBanner: false, home: Home());
  }
}

