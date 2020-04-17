import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';



class PushNotificationProvider{

   FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

   final _messageStreamController = StreamController<String>.broadcast(); 
   Stream<String> get message => _messageStreamController.stream;

   initNotifications(){
     _firebaseMessaging.requestNotificationPermissions();

     _firebaseMessaging.getToken().then((token){
       print('++++TOKEN+++++++++');
       print(token);
     });


     _firebaseMessaging.configure(
       onMessage: (info) async {
         print('+++++++++ on message ++++++++++++');
         print(info);

        String argument = 'no-data';
        if (Platform.isAndroid){
          argument = info['data']['comida'] ?? 'no-data';
        }
        _messageStreamController.sink.add(argument);
       },
        
       onLaunch: (info) async {
         print("+++++++++ on launch +++++++++++");
         print(info);
       },

       onResume: (info) async {
         print('========= on resume===========');
         print(info);

         final noti = info['data']['comida'];
         _messageStreamController.sink.add(noti);

          //info notification  push example
          //final noti = info['data']['comida'];
          //print(noti);
       }

     );
   }

   dispose(){
     _messageStreamController?.close();
   }

}