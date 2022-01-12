import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:chat_firebase/text_composer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({ Key? key }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  void _sendMessage({String? text, File? imgFile}) async{
    Map<String, dynamic> data = {};
    await Firebase.initializeApp();
    if(imgFile != null) {
      
      UploadTask task = FirebaseStorage.instance.ref().child(DateTime.now().millisecondsSinceEpoch.toString()).putFile(imgFile);
      TaskSnapshot taskSnapshot = await task.whenComplete(() => null);
      String url = await taskSnapshot.ref.getDownloadURL();
      data['imgUrl'] = url;
    }
    if(text != null) data['text'] = text;
    FirebaseFirestore.instance.collection('messages').add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Olá'), centerTitle: true, elevation: 0,),
      body: TextComposer(_sendMessage),
    );
  }
}