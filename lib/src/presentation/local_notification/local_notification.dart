import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// --- CALLBACKS GLOBALES ---
// (Deben estar fuera de la clase para que funcionen 
// cuando la app está cerrada o en segundo plano)

// Callback para iOS/macOS en primer plano
void onDidReceiveLocalNotification(
    int id, String? title, String? body, String? payload) async {
  // ... tu lógica aquí (ej. mostrar un diálogo)
  print('Notificación recibida en primer plano: $title');
}

// Callback para cuando el usuario TOCA la notificación (Todas las plataformas)
void onDidReceiveNotificationResponse(NotificationResponse notificationResponse) {
  final String? payload = notificationResponse.payload;
  if (payload != null) {
    print('Payload de la notificación: $payload');
    // Aquí puedes navegar a una pantalla específica
    // (ej. navigatorKey.currentState?.pushNamed('/detalle', arguments: payload))
  }
}

// --- TU CLASE MEJORADA ---
class LocalNotification {

  // ✅ MEJORA 1: Instancia única y estática
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> requesPermissionLocalNotification() async {
    // Usamos la instancia estática
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  // (Corregí el nombre de "Notificatio" a "Notification")
  static Future<void> initializeLocalNotification() async {
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
        
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
          requestAlertPermission: true,
          requestSoundPermission: true,
          requestBadgePermission: true,
          requestProvisionalPermission: false,
          requestCriticalPermission: false,
          requestProvidesAppNotificationSettings: false,
          defaultPresentAlert: true,
          defaultPresentSound: true,
          defaultPresentBadge: true,
          defaultPresentBanner: true,
          defaultPresentList: true,
    
    );

    const initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsDarwin);

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      
      // ✅ MEJORA 2: Añadir el callback de "toque"
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse: onDidReceiveNotificationResponse,
    );
  }

  // ✅ MEJORA 3: El método 'iosShowNotification' era redundante
  // Simplemente llama a 'showLocalNotification' desde cualquier parte.

  static Future<void> showLocalNotification({
    required int id,
    String? title,
    String? body,
    String? data, // 'data' se usará como el 'payload'
  }) async {
    const androitDetails = AndroidNotificationDetails(
        'channelId', 'channelName',
        playSound: true, importance: Importance.max, priority: Priority.high);

    const notificationDetails = NotificationDetails(
        android: androitDetails,
        iOS: DarwinNotificationDetails(
          presentSound: true,
          presentAlert: true,
          // (Te sugiero añadir 'presentBadge' si usas contadores)
          // presentBadge: true, 
        ));

    // Usamos la instancia estática
    await _flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
      payload: data, // Pasa tus datos aquí como 'payload'
    );
  }
}