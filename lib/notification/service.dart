import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

class FirebaseNotificationService {
  late final FirebaseMessaging messaging;
  void settingNotification() async{
    await messaging.requestPermission(
      alert: true,
      sound: true,
      badge: true,
    );
  }
  void connectNotification()async{
    await Firebase.initializeApp();
    messaging = FirebaseMessaging.instance;
    messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true,
    );

    settingNotification();
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      Grock.snackBar(title: "${event.notification?.title}",
        description: "${event.notification?.body}",
        duration: Duration(minutes: 1),
        opacity:0.8,
        color: Colors.black,
        position: SnackbarPosition.top,
        leading: event.notification?.android?.imageUrl ==null
            ? null
            : Image.network("${event.notification?.android?.imageUrl}"),
      );

    });


  }
  static Future<void> backgroundMessage(RemoteMessage message)async{
    await Firebase.initializeApp();
    print("Handling");

  }
}