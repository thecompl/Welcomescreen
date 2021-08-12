import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_flutter/Login.dart';

import 'Data.dart';
class Forgot_Password extends StatefulWidget {
  const Forgot_Password({Key? key}) : super(key: key);

  @override
  _Forgot_PasswordState createState() => _Forgot_PasswordState();

}

class _Forgot_PasswordState extends State<Forgot_Password> {
   TextEditingController curpwd = TextEditingController();
   TextEditingController newpwd = TextEditingController();
   TextEditingController conpwd = TextEditingController();
  String msg="";
  var Firestoredb = FirebaseFirestore.instance.collection('data').snapshots();

  @override

  Widget build(BuildContext context) {
    return Scaffold(
        body:SingleChildScrollView(

       child: Container(

            child:Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  child:ClipPath(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height *0.5,
                      decoration:BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.tealAccent,Colors.cyan]
                          )
                      ),
                    ),
                    clipper:MyCustomClipper(),
                  ),
                ),
                SizedBox(
                  height:20,
                ),
                Container(


                  child:Align(
                    alignment: Alignment(-0.85,-0.75),
                    child:Text(
                    'Change Your password',style: TextStyle(fontWeight: FontWeight.bold,color:Colors.blueGrey,fontSize:25),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                txt('current password',true,curpwd),
                txt('New password',true,newpwd),
                txt('confirm password',true,conpwd),
                btn(),
                Container(
                    child:Text(msg)
                ),
                // ListView(
                //       children: [
                //           // fetchdata()
                //         ],
                //     )
                


              ],
            )


        ),
      )

    );
  }
  Widget txt(title,password, TextEditingController con){
      return Container(
        width: MediaQuery.of(context).size.width*0.9,
        margin: EdgeInsets.only(bottom:20),
        child: TextField(
          controller: con,
          obscureText: password,
            decoration: InputDecoration(

              labelText: title,
            ),
        ),
      );
  }
  Widget btn(){
    return Container(
      width: MediaQuery.of(context).size.width*0.9,
      height: MediaQuery.of(context).size.height*0.05,

      child: ElevatedButton(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Data()),
        );
          setState(() {
              msg = curpwd.text+" "+newpwd.text+" " +conpwd.text;
              print(msg);
              adddata();
          });


      }, child:Text('change password'),
      style: ElevatedButton.styleFrom(
        primary: Colors.cyan
      ),
      ),
    );
  }
  adddata(){
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('data');
    collectionReference.add({"current password"  : curpwd.text,"new password"  : newpwd.text});
  }

  // fetchdata(){
  //   StreamBuilder(
  //     stream: Firestoredb , builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
  //     if(!snapshot.hasData)return CircularProgressIndicator();
  //     return ListView.builder(
  //         itemCount: snapshot.data.docs.length,
  //         itemBuilder:(context,int index){
  //           return Text(snapshot.data.docs[index]['current password'],style: TextStyle(color: Colors.black),);
  //         }
  //     );
  //   },
  //   );
  // }



}
class MyCustomClipper extends CustomClipper<Path>{
  var radius=10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width/4, size.height
        - 40, size.width/2, size.height-20);
    path.quadraticBezierTo(3/4*size.width, size.height,
        size.width, size.height-30);
    path.lineTo(size.width, 0);
    return path;

  }

  @override
  bool shouldReclip( CustomClipper<Path> oldClipper) =>
      false;
}








