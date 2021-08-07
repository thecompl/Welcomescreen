import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/Login.dart';
class Forgot_Password extends StatefulWidget {
  const Forgot_Password({Key? key}) : super(key: key);

  @override
  _Forgot_PasswordState createState() => _Forgot_PasswordState();
}

class _Forgot_PasswordState extends State<Forgot_Password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot password page'),
      ),
      body:Center(
       child: Container(
         width: 400,
            child:Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.black26,
                  width: 400,
                  height: 50,
                  child:Center(
                    child:Text(
                    'Change Your password',style: TextStyle(fontWeight: FontWeight.bold,color:Colors.white,fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                txt('current password',true),
                txt('New password',true),
                txt('confirm password',true),
                btn()
              ],
            )


        ),
      )

    );
  }
  Widget txt(title,password){
      return Container(
        margin: EdgeInsets.only(bottom:20),
        child: TextField(
          obscureText: password,
            decoration: InputDecoration(
              border:OutlineInputBorder(),
              labelText: title,
            ),
        ),
      );
  }
  Widget btn(){
    return Container(
      width: 400,
      height: 50,
      child: ElevatedButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Login() ));
      }, child:Text('change password'),

      ),
    );
  }

}

