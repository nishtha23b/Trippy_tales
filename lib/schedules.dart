import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  Future _data;
  Future getPosts() async {
    var firestore=Firestore.instance;
    QuerySnapshot qn= await firestore.collection("users").document(widget.uid).collection("schedule").getDocuments();
    return qn.documents;
  }

  navigateToDetail (DocumentSnapshot post){
    Navigator.push(context, MaterialPageRoute(builder:(context)=>Schedule(post: post,)));
  }
  @override
  void initState() {
    super.initState();
    _data=getPosts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        title: Text('Forts'),
      ),
      body:  Container(
        child: FutureBuilder(
          future:_data,
          builder: (BuildContext,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(
                child:Text('Loading..'),
              );
            }
            // ignore: missing_return
            else if(snapshot.data.length==0){
              return Center(
                child: Text('No schedule created yet..'),
              );
            }
            else{
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext ,index){
                    return new  SingleChildScrollView(
                      child:  Card(
                          elevation: 10,
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Padding(
                                padding: const EdgeInsets.only(top:8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(snapshot.data[index].data['placeName'],style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.cyan[600],
                                    ),
                                      textAlign: TextAlign.left,),
                                    Text(snapshot.data[index].data['placeName'],style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.cyan[600],
                                    ),
                                      textAlign: TextAlign.left,),
                                    Text(snapshot.data[index].data['placeName'],style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.cyan[600],
                                    ),
                                      textAlign: TextAlign.left,),
                                  ],
                                ),
                              ),
                            ),

                          ),
                        ),
                    );
                  }
              );
            }
          },
        ),
        //ListView,
      ),
    );
  }
}