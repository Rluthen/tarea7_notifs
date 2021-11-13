import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:push_notifs_o2021/home/home_page.dart';

import 'utils/constants_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalNotifications();
  FirebaseApp firebaseApp = await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(MyApp());
}

// FB token :
// eaOSsTGJQiidxPmPfYYL6Q:APA91bFhuxguK7XeMojBvJNRJjKwXtQ9VDUopF3Xty3Tb10UhfMOjUEmIVRPvyoTtkgIbsWpRaJGUPXFmct1bOO-i55rt502ChK7YmnRYYVTopHcAXYpzCYtzCry9_SuF7kiHEjVBNuG
Future initLocalNotifications() async {
  // TODO: inicializar los canales
  await AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
          channelKey: channelSimpleId,
          channelName: channelSimpleName,
          channelDescription: channelScheduleDescr,
          defaultColor: Colors.purple,
          ledColor: Colors.green,
          importance: NotificationImportance.High),
      NotificationChannel(
          channelKey: channelScheduleId,
          channelName: channelScheduleName,
          channelDescription: channelScheduleDescr,
          defaultColor: Colors.purple,
          ledColor: Colors.blue,
          importance: NotificationImportance.Default),
      NotificationChannel(
          channelKey: channelBigPictureId,
          channelName: channelBigPictureName,
          channelDescription: bigPictureDescr,
          defaultColor: Colors.purple,
          ledColor: Colors.red,
          importance: NotificationImportance.Default),
    ],
  );
}

// Declared as global, outside of any class
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");

  // Use this method to automatically convert the push data, in case you gonna use our data standard
  AwesomeNotifications().createNotificationFromJsonData(message.data);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme(
          primary: Colors.indigo,
          primaryVariant: Colors.indigoAccent,
          secondary: Colors.green,
          secondaryVariant: Colors.lime,
          surface: Colors.grey[200]!,
          background: Colors.grey[200]!,
          // background: Colors.deepPurple[100]!,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.grey,
          onBackground: Colors.deepPurple[100]!,
          onError: Colors.red,
          brightness: Brightness.light,
        ),
      ),
      home: HomePage(),
    );
  }
}
