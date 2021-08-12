import 'package:flutter/material.dart';
import 'package:my_flutter/Registration.dart';
import 'package:video_player/video_player.dart';
import 'Login.dart';

class Welcomescreen extends StatefulWidget {
  const Welcomescreen({Key? key}) : super(key: key);

  @override
  _WelcomescreenState createState() => _WelcomescreenState();
}

class _WelcomescreenState extends State<Welcomescreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Pointing the video controller to our local asset.
    _controller = VideoPlayerController.asset("assets/video/bgvideo.mp4")
      ..initialize().then((_) {
        // Once the video has been loaded we play the video and set looping to true.
        _controller.play();
        _controller.setVolume(0.0);
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

        body: Container(
          child: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: SizedBox(
                      width: _controller.value.size.width,
                      height: _controller.value.size.height,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                ),
              ),
              Container(

                width: MediaQuery.of(context).size.width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width:MediaQuery.of(context).size.width*0.9,
                        height:MediaQuery.of(context).size.height*0.05,
                        child:btn(Login(),'Login'),
                      ),


                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal:size.height * 0.05),
                        child:Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            divider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(' OR ' ,style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:15),),
                            ),
                            divider()
                          ],
                        ),
                      ),
                      SizedBox(height:5,),
                      Container(
                          width:MediaQuery.of(context).size.width*0.9,
                          height:MediaQuery.of(context).size.height*0.05,
                          child: btn(Registartion(),'sign up')
                      ),
                      SizedBox(
                          height: 30
                      )
                    ]),
              ),
            ],
          ),
        ));
  }
  Widget btn(change,text){
    return Container(

        child:OutlinedButton(
          onPressed: () {
            Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => change,
              ),
            );
          },
          child: Text(text),
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent,
            padding: EdgeInsets.all(8),
            side: BorderSide(color: Colors.white, width: 1.5),
            // shape: const RoundedRectangleBorder(
            //     borderRadius: BorderRadius.all(Radius.circular(10))),

            primary: Colors.white,
            textStyle: TextStyle(
                fontWeight: FontWeight.w500,
                letterSpacing: 0.9,
                fontSize:22,
                fontStyle: FontStyle.normal),
          ),
        )
    ) ;
  }
  Widget divider(){
    return  Expanded(child: Divider(height:1.5,color: Colors.white,));
  }
}
