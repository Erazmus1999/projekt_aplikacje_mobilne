import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:projekt_aplikacje_mobilne/Firebase/database.dart';
import 'package:projekt_aplikacje_mobilne/Models/product.dart';
import 'package:projekt_aplikacje_mobilne/Screens/add_fridge_item.dart';
import 'package:projekt_aplikacje_mobilne/Screens/addingitem.dart';
import 'package:projekt_aplikacje_mobilne/Screens/auth/login_popup.dart';
import 'package:projekt_aplikacje_mobilne/Screens/fridge/fridge_content.dart';
import 'package:projekt_aplikacje_mobilne/Screens/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Smart Fridge'),
    );
  }
}
