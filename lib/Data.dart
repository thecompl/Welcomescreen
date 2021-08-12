import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Data extends StatefulWidget {
  const Data({Key? key}) : super(key: key);

  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  var Firestoredb = FirebaseFirestore.instance.collection('data').snapshots();
  void initState(){
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
      child: Fetchdata(),
      )
      );


  }
 Widget Fetchdata(){
   return Container(child:
   StreamBuilder(
     stream: Firestoredb , builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
       print(snapshot);
     if(!snapshot.hasData) return CircularProgressIndicator();
     return ListView.builder(
         itemCount: snapshot.data.docs.length,
         itemBuilder:(context,int index){
           return Container(
               child: Column(
                 children: [
                   Text(snapshot.data.docs[index]['current password'],style: TextStyle(color: Colors.black)),
                   Text(snapshot.data.docs[index]['new password'],style: TextStyle(color: Colors.black))
                 ],
               )
           );
         }
     );
   },
   ),
   );
  }
 void getData() async{
    var response =  await Dio().get('https://restcountries.eu/rest/v2/all');
    print("country " + response.data.toString());
  }
}

