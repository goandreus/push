import 'package:flutter/material.dart';
import 'package:notifications/src/pages/home_page.dart';
import 'package:notifications/src/pages/message_page.dart';
import 'package:notifications/src/providers/push_notification_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();

    final pushProvider = PushNotificationProvider();
    pushProvider.initNotifications();

    pushProvider.message.listen((data){
       // Navigator.pushNamed(context, routeName)
       print('Push Argument');
       print(data);
       navigatorKey.currentState.pushNamed('message', arguments: data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Push App',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(), 
        'message': (BuildContext context) => MessagePage(), 
      },
    );
  }
}