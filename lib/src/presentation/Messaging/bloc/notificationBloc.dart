import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:sniper_pro/src/presentation/Messaging/bloc/notificationEvent.dart';
import 'package:sniper_pro/src/presentation/Messaging/bloc/notificationState.dart';
import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/presentation/local_notification/local_notification.dart';
Future<void> firebaseMessagingBackgroundHandler(
        RemoteMessage message) async {
      var mensaje = message.data;
      var body = mensaje['body'];
      var title = mensaje['title'];
      Random random = Random();
      var id = random.nextInt(10000);
      LocalNotification.showLocalNotification(
          id: id, title: title, body: body);
    }

class NotificationBloc extends Bloc<notificationEvent, notificationState> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  AuthUseCases authUseCases;

 
  NotificationBloc(this.authUseCases) : super(notificationState()) {
    

    _onForegrounMessage();
  }

  void requesPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: true,
        provisional: false,
        sound: true);
    await LocalNotification.requesPermissionLocalNotification();
    settings.authorizationStatus;
    _getToken();
  }

  void _getToken() async {
    final settings = await messaging.getNotificationSettings();
    if (settings.authorizationStatus != AuthorizationStatus.authorized) return;

    final token = await messaging.getToken();
    if (token != null) {
      var tokenprefs = '';
      tokenprefs = token;

      await authUseCases.messagetoken.run(token);
      print('token:' + token);
    }
  }

  Future<void> handleRemoteMessage(RemoteMessage message) async {
    var mensaje = message.notification;
    var body = mensaje?.body;
    var title = mensaje?.title;
    Random random = Random();
    var id = random.nextInt(10000);

    LocalNotification.showLocalNotification(id: id, title: title, body: body);
     print('entro');

   
  }

  void _onForegrounMessage() {
    FirebaseMessaging.onMessage.listen(handleRemoteMessage);
    FirebaseMessaging.onBackgroundMessage(handleRemoteMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleRemoteMessage);
  }
}
