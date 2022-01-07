import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  runApp(MyApp());
  await Firebase.initializeApp();
  /* FirebaseFirestore.instance
      .collection("mensagens")
      .doc("msg2")
      .set({"texto": "tudo bem?",
      "from": 'Alex',
      "read": false
      }); */
  FirebaseFirestore.instance
      .collection("mensagens")
      .doc("msg2").collection("arquivos").doc().set({"arqName" : "foto.png"});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  Container(),
    );
  }
}


