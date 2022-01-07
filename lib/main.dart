import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  runApp(MyApp());
  await Firebase.initializeApp();
  //O QuerySnapshot recebe vários documentos
  /* QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection("mensagens")
      .get();
      snapshot.docs.forEach((d) { 
        print(d.data());
      }); */

  //Pegando os id
  /* QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection("mensagens")
      .get();
      snapshot.docs.forEach((d) { 
        print(d.data());
        print(d.id);
      }); */

  //Alterando os dados de todos pelo id
  /* QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection("mensagens")
      .get();
      snapshot.docs.forEach((d) { 
        d.reference.update({'lido': true});
      }); */

  //O DocumentSnapShot recebe só um valor
  /* DocumentSnapshot snapshot = await FirebaseFirestore.instance
      .collection("mensagens").doc('msg1')
      .get();
      print(snapshot.data()); */

  //Atualização em tempo real
  FirebaseFirestore.instance.collection('mensagens').snapshots().listen((dado){
    dado.docs.forEach((d) { 
      print(d.data());
    });
  });
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


