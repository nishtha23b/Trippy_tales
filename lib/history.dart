import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class HistoryPage extends StatefulWidget {
  final DocumentSnapshot post;
  HistoryPage({this.post});
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
 final FlutterTts flutterTts= FlutterTts();

  speak() async{
    await flutterTts.setLanguage("en-IN");
    await flutterTts.setPitch(1);
    await flutterTts.speak(widget.post.data['history']);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.post.data['placeName']),
          backgroundColor:Colors.amber[700],
        ),
        body:SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: Image.network(widget.post.data['image'],fit: BoxFit.contain,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: Text(widget.post.data['history'],style:TextStyle(fontSize: 15.0),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: RaisedButton(
                  elevation: 10.0,
                  onPressed: () => speak(),
                  child: Text("Listen"),
                ),
              ),
            ],
          ),
        )
    );
  }
}
