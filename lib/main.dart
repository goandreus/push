import 'package:flutter/material.dart';
import 'package:notifications/src/providers/push_notification_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();

    final pushProvider = PushNotificationProvider();
    pushProvider.initNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Push App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App'),
        ),
        body: Center(
          child: Container(
            child: Text('hi'),
          ),
        ),
      ),
    );
  }
}