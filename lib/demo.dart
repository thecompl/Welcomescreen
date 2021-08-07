import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/Forget_Password.dart';

import 'Registration.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      // appBar: AppBar(
      //     title:Text('login page'),
      // ),

        body:

        Center(
            child:SingleChildScrollView(
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  ClipPath(
                    child:Container(
                      child: Align(

                          child: Text(
                              'Login',style:TextStyle(color: Colors.white, fontSize:40,fontWeight: FontWeight.bold)
                          )
                      ),
                      width: MediaQuery.of(context).size.width *1,
                      height: MediaQuery.of(context).size.height *0.5,


                      decoration:BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.tealAccent,Colors.cyan]
                          )
                      ),


                    ),

                    clipper: MyCustomClipper(),
                  ),
                  // Container(
                  //
                  //   width: MediaQuery.of(context).size.width*1,
                  //   height:MediaQuery.of(context).size.height*0.53,
                  //   color: Colors.lightBlue,
                  //   child: Align(
                  //     alignment: Alignment(-0.9,-0.01),
                  //       child:Text('Login',
                  //   style:TextStyle(color: Colors.white, fontSize:40,fontWeight: FontWeight.bold)
                  //   ))
                  // ),
                  SizedBox(
                    height:40,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      height: MediaQuery.of(context).size.height*0.5,
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Align(
                            alignment: Alignment(-0.99,-0.75),
                            child: Text(
                                'Happy to see you again',style:TextStyle(color: Colors.black, fontSize:15)
                            ),
                          ),

                          txt('Email',false),
                          txt('Password',true),

                          SizedBox(
                            height:10,
                          ),

                          GestureDetector(

                            child:Container(

                              child:Align(
                                alignment: Alignment(0.8,-0.75),
                                child: Text(
                                    'Forgot Password',style: TextStyle(color: Colors.lightBlue,fontWeight:FontWeight.bold)
                                ),
                              ),
                            ),
                            onTap: (){

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => Forgot_Password()),
                              );
                            },

                          ),

                          SizedBox(
                            height:30,
                          ),

                          btn(),
                          SizedBox(
                            height:120,
                          ),
                          Container(
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Not have account ',style: TextStyle(fontSize: 18),),
                                  GestureDetector(

                                    child:Text('Register',style: TextStyle(color: Colors.lightBlue,fontWeight:FontWeight.bold,fontSize:22)),
                                    onTap: (){

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Registartion()),
                                      );
                                    },

                                  ),
                                ],
                              )

                          ),
                        ],
                      )
                  ),
                ],
              ),
            )


        )


    );
  }
  Widget txt(title,password){
    return Container(
        margin: EdgeInsets.only(bottom:30),

        width:MediaQuery.of(context).size.width * 0.85,
        child: TextField(

          style: TextStyle(fontSize:18,letterSpacing: 0.7),

          obscureText: password,
          decoration: InputDecoration(
            hintText:"Please enter your "+title ,
            hintStyle: TextStyle(fontSize: 15,letterSpacing:0.5),
            labelText: title,

          ),
        )
    );
  }
  Widget btn(){
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.tealAccent, Colors.cyan],
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
        ),
      ),
      width:MediaQuery.of(context).size.width*0.85,

      height:50,
      child: Center(child: Text('Login',style:TextStyle(letterSpacing: 0.5,fontSize:22,fontWeight: FontWeight.bold,color: Colors.white),)),
    );

  }
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
