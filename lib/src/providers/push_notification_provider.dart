import 'package:firebase_messaging/firebase_messaging.dart';



class PushNotificationProvider{

   FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

   initNotifications(){
     _firebaseMessaging.requestNotificationPermissions();

     _firebaseMessaging.getToken().then((token){
       print('++++TOKEN+++++++++');
       print(token);
     });
   }

}