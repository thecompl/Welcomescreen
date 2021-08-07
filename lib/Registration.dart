import 'package:flutter/material.dart';

import 'Login.dart';
class Registartion extends StatefulWidget {
  const Registartion({Key? key}) : super(key: key);

  @override
  _RegistartionState createState() => _RegistartionState();
}

class _RegistartionState extends State<Registartion> {

  String? ValueChoose;
  String? ValueChoosecity;
  List listItem = [
    'gujarat','Madhya pradesh','Uttar pradesh','orisa','Rajstan','tamilnadu'
  ];
  List citylistitem = [
    'surat','sivpuri','lakhnow','buneshwer','udaipur','keral'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Page'),
      ),
      body:Center(

       child:Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Container(

             child: Center(
                 child:Text('Registration',style:TextStyle( fontSize:30,fontWeight: FontWeight.bold,color: Colors.white),)
             ),
             color: Colors.black26,
             width: 400,
             height: 50,
           ),
           SizedBox(
             height:20,
           ),
           Container(
               width: 400,
               child:Column(

                 children: [
                   txt('Username'),
                   txt('Email'),
                   txt('Password'),


                 ],

               )
           ),
           Container(
             width: 400,
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
               width: 400,
               child: DropdownButton<String>(
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
                 items: citylistitem.map((valueItem){

                   return DropdownMenuItem<String>(
                       value: valueItem,
                       child: Text(valueItem)
                   );
                 }).toList(),
               )
           ),
           Container(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text('already have account '),
               GestureDetector(
                 child: Text(' Login',style:TextStyle(color: Colors.lightBlue,fontWeight: FontWeight.bold,fontSize:15)),
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
             width: 400,
               height: 50,
               child: btn()
           )


         ],
       )
      )

    );
  }

  Widget txt(title){
    return Container(
      margin: EdgeInsets.only(bottom:10),
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(),
          labelText: title,
        ),
      ),

    );
  }
  Widget btn(){
    return Container(
      child:ElevatedButton(
        onPressed: () {  },
        child: Text('Sign Up'),

      ),
    );
  }

}
