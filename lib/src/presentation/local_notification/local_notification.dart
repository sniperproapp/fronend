import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification {
  static Future<void> requesPermissionLocalNotification() async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  static Future<void> initializeLocalNotificatio() async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const initializationSettingsDawis = DarwinInitializationSettings(
      
       );

    const initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsDawis);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static void iosShowNotification(
      int id, String? title, String? body, String? data) {
    showLocalNotification(id: id, title: title, body: body, data: data);
  }

  static void showLocalNotification(
      {required int id, String? title, String? body, String? data}) {
    const androitDetails = AndroidNotificationDetails(
        'channelId', 'channelName',
        playSound: true, importance: Importance.max, priority: Priority.high);

    const notificationDetails = NotificationDetails(
        android: androitDetails,
        iOS: DarwinNotificationDetails(presentSound: true, presentAlert: true));

    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    flutterLocalNotificationsPlugin.show(id, title, body, notificationDetails);
  }
}
