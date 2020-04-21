import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddPlaces extends StatefulWidget {
  @override
  _AddPlacesState createState() => _AddPlacesState();
}
class _AddPlacesState extends State<AddPlaces> {
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
                  
                });
              },),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DateTimeField(
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

                  }
              ),
            ),

          ],
        ),
      ),
    );
  }
}
