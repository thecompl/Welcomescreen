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

      body:SingleChildScrollView(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

                 Container(
                   child: ClipPath(
                     child:Container(
                              // child: Image.asset(
                             //
                             //   "assets/images/logo.jpg",
                             //
                             // ),
                       width: MediaQuery.of(context).size.width *1,
                       height: MediaQuery.of(context).size.height *0.45,


                       decoration:BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.tealAccent,Colors.cyan]
                            )
                       ),


                ),

                     clipper: MyCustomClipper(),
              ),
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

              Container(

                    // height: MediaQuery.of(context).size.height*0.55,
                  child:Column(
                    children: [
                      Center(
                        child: Align(
                          alignment: Alignment(-0.82,-0.75),

                          child: Text(
                              'Login',style:TextStyle(color: Colors.blueGrey, fontSize:40,fontWeight: FontWeight.bold)
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Align(
                        alignment:Alignment(-0.81,-0.75),
                          child: Text('Happy to see you again',style:TextStyle(fontSize:14,fontWeight:FontWeight.bold))
                      ),



                      SizedBox(
                        height:30,
                      ),
                      txt('Email',false),
                      txt('Password',true),

                      SizedBox(
                        height:10,
                      ),
                        Container(
                            child: Align(
                                alignment: Alignment(0.8,-0.75),
                                child: text('forgot password',15,Forgot_Password(),Colors.cyan)
                            )
                        ),


                      SizedBox(
                        height:30,
                      ),

                      btn(),

                      Container(
                        width:MediaQuery.of(context).size.width*0.85,
                          height:100,


                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Not have account ',style: TextStyle(fontSize: 18),),
                              text('Register',22,Registartion(),Colors.cyan)
                            ],
                          )

                      ),
                    ],
                  )
              ),


            ],
          ),

        )


    );
  }
  Widget txt(title,password){
    return Container(

     width:MediaQuery.of(context).size.width * 0.85,
      child: TextField(

          style: TextStyle(fontSize:18,letterSpacing: 0.7,color:Colors.cyan),

          obscureText: password,
            decoration: InputDecoration(
              hintText:"Please enter your "+title ,
              hintStyle: TextStyle(fontSize: 15,letterSpacing:0.5,color:Colors.cyan),
              labelText: title,

            ),
      )
    );
  }
  Widget btn(){
    return Container(

      width:MediaQuery.of(context).size.width*0.86,
      height:50,

      child: ElevatedButton(onPressed: () {

      },
        child: Text('Login',style:TextStyle(letterSpacing: 0.5,fontSize:22,fontWeight: FontWeight.bold,color: Colors.white),),
        style: ElevatedButton.styleFrom(
        primary: Colors.cyan,
        onPrimary: Colors.tealAccent,
        onSurface: Colors.tealAccent,
      ),
      ),

    );

  }
  Widget text(text,double size,route,color){
      return  GestureDetector(

        child:Text(
            text,
            style: TextStyle(color:color,fontWeight:FontWeight.bold,fontSize: size,)),

        onTap: (){

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => route),
          );
        },

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
