import 'package:flutter/material.dart';
class Schedule extends StatefulWidget{
  _ScheduleState createState()=> _ScheduleState();
}


class _ScheduleState extends State<Schedule> {
  var isLoader =false;
  var result ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("add place"),
      ),
      body: Container(
        child:
        isLoader?Center(child: CircularProgressIndicator(),):ListView.builder(

          itemCount: result == null ? 0 : result.length,
          itemBuilder: (BuildContext context, int index) {
            return new  Card(
              elevation: 10,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //yha pe card ki items aayegi jaisa apn ne api me ki thi waisa hi
                        Text("${result[index]["Job Title"]}",style: TextStyle(
                          fontSize: 20,
                          color: Colors.cyan[600],
                        ),
                          textAlign: TextAlign.left,),
                      ],
                    ),
                  ),
                ),

              ),
            );
          },
        ),
      ),
    );
  }
}
//yahi code usme bhi use hoga add place krne se pehle wali screen pr
