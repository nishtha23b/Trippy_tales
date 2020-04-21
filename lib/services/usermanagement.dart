import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class UserManagement{
  storeNewUser(currentUser,context){
    Firestore.instance.collection('/users').document(currentUser.uid).setData({
      'email':currentUser.email,
      'uid':currentUser.uid
    }).then((value){
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed('/homepage');
    }).catchError((e){
      print(e);
    });
  }
}