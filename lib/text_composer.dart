import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TextComposer extends StatefulWidget {
  TextComposer(this.sendMessage);

  final Function({String text, File imgFile}) sendMessage;
  
  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  final TextEditingController _textController = TextEditingController();
  bool _isComposing = false;
  _reset(){
    _textController.clear();       
    setState(() {
      _isComposing = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Row(children: [
        IconButton(onPressed: () async{
         final XFile? imgFile = await ImagePicker().pickImage(source: ImageSource.camera);
         if(imgFile == null) return;
         
        widget.sendMessage(imgFile: File(imgFile.path));
        }, icon: Icon(Icons.photo_camera)),
        
        Expanded(child: TextField(decoration: 
        InputDecoration.collapsed(hintText: 'Enviar uma mensagem'), 
        onChanged: (text){
          setState(() {
            _isComposing = text.isNotEmpty;
          });
        
        },
        controller: _textController,
         onSubmitted: (text){
          widget.sendMessage(text: text);
          _reset();
        },)),
        IconButton(icon: Icon(Icons.send), onPressed: _isComposing? (){
          widget.sendMessage(text: _textController.text);
          _reset();
        }: null)
      ],),
    );
  }
}