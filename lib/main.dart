import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'AnimatedScreen.dart';


// AndroidNotificationChannel channel = AndroidNotificationChannel(
//     'high_importance_channel', 'high Impotant notification', 'this channel used for the important channel',
//   importance: Importance.high,
//   playSound: true
// );

// final  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin
// = FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async{
  await Firebase.initializeApp();
  print('A bg messge just showed up: &{message.messageId}');
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  //
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   RemoteNotification? notification = message.notification;
  //   AndroidNotification? android = message.notification?.android;
  //   if (notification != null && android != null) {
  //
  //     flutterLocalNotificationsPlugin.show(
  //         notification.hashCode,
  //         notification.title,
  //         notification.body,
  //         NotificationDetails(
  //           android: AndroidNotificationDetails(
  //             channel.id,
  //             channel.name,
  //             channel.description,
  //             // TODO add a proper drawable resource to android, for now using
  //             //      one that already exists in example app.
  //
  //           ),
  //
  //         ));
  //   }
  // });
  // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  // final routeFromMessage =  message.data["route"];
  // print(routeFromMessage);
  // });

  runApp(My_App());
}

class My_App extends StatefulWidget {
  const My_App({Key? key}) : super(key: key);
  @override

  _My_AppState createState() => _My_AppState();
}

class _My_AppState extends State<My_App> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: AnimatedScreen(),
      title: 'MY flutter App',
    );
  }
}
