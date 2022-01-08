import 'package:flutter/material.dart';

class TextComposer extends StatefulWidget {
  TextComposer(this.sendMessage);

  Function(String) sendMessage;
  
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
        IconButton(onPressed: (){
          
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
          widget.sendMessage(text);
          _reset();
        },)),
        IconButton(icon: Icon(Icons.send), onPressed: _isComposing? (){
          widget.sendMessage(_textController.text);
          _reset();
        }: null)
      ],),
    );
  }
}