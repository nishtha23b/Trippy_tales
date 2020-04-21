import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trippy_tales/history.dart';

class CardsPage extends StatefulWidget {
  @override
  _CardsPageState createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  Future _data;
  Future getPosts() async {
    var firestore=Firestore.instance;
    QuerySnapshot qn= await firestore.collection('place').getDocuments();
    return qn.documents;
  }

  navigateToDetail (DocumentSnapshot post){
    Navigator.push(context, MaterialPageRoute(builder:(context)=> HistoryPage(post: post,)));
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
              else{
                return ListView.builder(
                  itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext ,index){
                      return new  SingleChildScrollView(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child:GestureDetector(
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image.network(
                          snapshot.data[index].data['image'],
                          fit: BoxFit.fill,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 10,
                        margin: EdgeInsets.all(10),
                      ),
                      onTap: ()=> navigateToDetail(snapshot.data[index]),
                    ),
                  ),
                  Text(snapshot.data[index].data['placeName'],
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      ]
                      )
                      )
                      ]
                      )
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