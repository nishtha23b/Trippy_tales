import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddPlaces extends StatefulWidget {
  AddPlaces({Key key, this.title, this.uid}) : super(key: key); //update this to include the uid in the constructor
  final String title;
  final String uid;
  @override
  _AddPlacesState createState() => _AddPlacesState();
}
class _AddPlacesState extends State<AddPlaces> {
  List<String> _place;
  List<DateTime> _date;
  List<DateTime> _time;
  TextEditingController placeInputController=new TextEditingController();
  TextEditingController dateInputController=new TextEditingController();
  TextEditingController timeInputController=new TextEditingController();
  var i=0;
  var j=0;
  var k=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Add places'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(decoration: InputDecoration(
                  hintText: 'Enter the Name of the Place'
              ),
              onChanged: (value){
                setState(() {
                  _place[i]=value;
                  i++;
                });
              },
              controller: placeInputController,),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DateTimeField(
controller: timeInputController,
                onChanged: (value){
                  setState(() {
                    _time[j]=value;
                    j++;
                  });
                },
                decoration: InputDecoration(
                    hintText: 'Enter the time of visit'
                ),
                format: DateFormat("HH:mm"),
                onShowPicker: (context, currentValue) async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                  );
                  return DateTimeField.convert(time);
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DateTimeField(
                controller: dateInputController,
                onChanged: (value){
                  setState(() {
                    _date[k]=value;
                    k++;
                  });
                },
                decoration: InputDecoration(
                    hintText: 'Enter Date'
                ),
                format: DateFormat("yyyy-MM-dd"),
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RaisedButton(
                  child: Text("Add Place"),
                  onPressed: () {
                    if (placeInputController.text.isNotEmpty &&
                        timeInputController.text.isNotEmpty &&
                        dateInputController.text.isNotEmpty) {
                      Firestore.instance
                          .collection("users")
                          .document(widget.uid)
                          .collection('tasks')
                          .document().setData({
                        "place":FieldValue.arrayUnion(_place),
                        "date":FieldValue.arrayUnion(_date),
                        "time":FieldValue.arrayUnion(_time),
                      })
                          .then((result) =>
                      {
                        Navigator.pop(context),
                        placeInputController.clear(),
                        dateInputController.clear(),
                        timeInputController.clear(),
                      })
                          .catchError((err) => print(err));
                    }
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
