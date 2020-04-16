import 'package:firebase_messaging/firebase_messaging.dart';



class PushNotificationProvider{

   FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

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


       },
        
       onLaunch: (info) async {
         print("+++++++++ on launch +++++++++++");
         print(info);
       },

       onResume: (info) async {
         print('========= on resume===========');
         print(info);

          //info notification  push example
          //final noti = info['data']['comida'];
          //print(noti);
       }

     );
   }

}