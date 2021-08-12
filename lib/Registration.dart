import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_svg/svg.dart';
import 'Login.dart';

class Registartion extends StatefulWidget {
  const Registartion({Key? key}) : super(key: key);

  @override
  _RegistartionState createState() => _RegistartionState();
}

class _RegistartionState extends State<Registartion> {
  // String messageTitle = "Empty";
  // String notificationAlert = "alert";
  var city=[];
  String? ValueChoose;
  String? ValueChoosecity;
  List listItem = [
    'gujarat','Madhya pradesh','Uttar pradesh','orisa','Rajstan','tamilnadu'
  ];
  List citylistitem = [
    'surat','sivpuri','lakhnow','buneshwer','udaipur','keral'
  ];
  @override

  //   // _firebaseMessaging.configure(
  //   //   onMessage: (message) async{
  //   //     setState(() {
  //   //       messageTitle = message["notification"]["title"];
  //   //       notificationAlert = "New Notification Alert";
  //   //
  //   //     });
  //   //
  //   //   },
  //   //   onResume: (message) async{
  //   //     setState(() {
  //   //       messageTitle = message["data"]["title"];
  //   //       notificationAlert = "Application opened from Notification";
  //   //     });
  //   //
  //   //   },
  //   // );
  //   City();
  //   super.initState();
  // }
void initState(){
    City();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:SingleChildScrollView(

       child:Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Container(
             child: ClipPath(
               child: Container(
                 width: MediaQuery.of(context).size.width *1,
                 height: MediaQuery.of(context).size.height *0.5,


                 decoration:BoxDecoration(
                     gradient: LinearGradient(
                         colors: [Colors.tealAccent,Colors.cyan]
                     )
                 ),
               ),
               clipper:MyCustomClipper() ,
             ),
           ),
           SizedBox(height: 20,),
           Container(

             child: Align(
               alignment: Alignment(-0.85,-0.75),
                 child:Text('Registration',style:TextStyle(fontSize:35,fontWeight: FontWeight.bold,color: Colors.blueGrey),)
             ),

           ),
           SizedBox(
             height:20,
           ),
           Container(
               width: MediaQuery.of(context).size.width*0.9,
               child:Column(

                 children: [
                   txt('Username'),
                   txt('Email'),
                   txt('Password'),


                 ],

               )
           ),
           Container(
               width: MediaQuery.of(context).size.width*0.9,
               child: DropdownButton<String>(
             hint: Text("select state"),
             isExpanded: true,
             icon: Icon(Icons.arrow_drop_down),
             iconSize:30,

             value: ValueChoose,
             onChanged:(String? val){
               setState(() {
                 ValueChoose = val!;
               });

             },
             items: listItem.map((valueItem){

               return DropdownMenuItem<String>(
                   value: valueItem,
                   child: Text(valueItem)
               );
             }).toList(),
           )
           ),


           Container(
               width: MediaQuery.of(context).size.width*0.9,
               child: DropdownButton(
                 hint: Text("select city"),
                 isExpanded: true,
                 icon: Icon(Icons.arrow_drop_down),
                 iconSize:30,

                 value: ValueChoosecity,
                 onChanged:(String? value){
                   setState(() {
                     ValueChoosecity = value!;
                   });

                 },
                 items: city.map((valueItem){
                    print("city drop="+valueItem.toString() );
                   return DropdownMenuItem<String>(

                       value: valueItem['name'],
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text(valueItem['name']),
                           Container(
                             width:50,
                             height:50,
                             child: SvgPicture.network(
                               valueItem['flag'],
                                fit:  BoxFit.contain,


                             ),
                           )
                         ],
                       )
                   );
                 }).toList(),
               )
           ),
           // Container(
           //  child: Text(
           //    notificationAlert,
           //  )
           // ),
           // Container(
           //     child: Text(
           //       messageTitle,
           //       style: Theme.of(context).textTheme.headline4,
           //     )
           // ),
           SizedBox(
             height: 30,
           ),
           Container(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text('already have account '),
               GestureDetector(
                 child: Text(' Login',style:TextStyle(color: Colors.cyan,fontWeight: FontWeight.bold,fontSize:15)),
                 onTap: (){
                   setState(() {
                     Navigator.pushReplacement(
                         context, MaterialPageRoute(builder: (context) => Login() )
                     );
                   });
                 },
               ),
             ],
              )
           ),
           
           SizedBox(
             height: 30,
           ),
           Container(


               child: btn()
           ),
           SizedBox(
             height:30,
           ),


         ],
       )
      )

    );
  }
 City() async{

  var response = await Dio().get('https://restcountries.eu/rest/v2/all');

  setState(() {
    city=response.data;
  });

   print ('cities ===' + city.toString());

}
  Widget txt(title){
    return Container(
      margin: EdgeInsets.only(bottom:10),
      child: TextField(
        decoration: InputDecoration(

          labelText: title,
        ),
      ),

    );
  }
  Widget btn(){
    return Container(
      width: MediaQuery.of(context).size.width*0.9,
      child:ElevatedButton(
        onPressed: () {  },
        child: Text('Sign Up',style:TextStyle(fontSize:20),),
        style: ElevatedButton.styleFrom(
            primary: Colors.cyan
        ),
      ),
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
