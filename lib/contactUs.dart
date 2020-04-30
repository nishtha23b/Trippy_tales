import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// ignore: camel_case_types
class contactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact Us',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('Contact Us',
            style: TextStyle(color: Color(0xFF000000)),),
          backgroundColor: Colors.amber[700],
          centerTitle: true,
          leading:IconButton(icon:Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: ()=>Navigator.pop(context,false)),
        ),

        body: SingleChildScrollView(
          child:
          new Container(
            margin: new EdgeInsets.only(top: 50.0),
            alignment: Alignment.center,
            child: new Column(
                children: <Widget>[
                  new Text('Our working hours: Monday to Friday,'),
                  new Text('8:00 AM - 6:00 PM'),
                  new Container(
                      margin: new EdgeInsets.only(top: 50.0),
                      alignment: Alignment.center,
                      child: new Column(
                          children: <Widget>[
                            new Text('ADDRESS',style: TextStyle(fontWeight: FontWeight.bold)),
                            new Text(' '),
                            new Text('Acrpolis Institute Of Technology & Research'),
                            new Text('Manglia,'),
                            new Text('Indore, India - 452001'),
                            new Text('(Phone No - 898654998)'),
                          ]
                      )
                  )
                ]
            ),
          ),
        ),
      ),
    );
  }
}