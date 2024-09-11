import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/binding_controller.dart';
import 'home_screen.dart';
// import 'screens/home_screen.dart';
// import 'screens/cart_screen.dart';
// import 'screens/product_details_screen.dart';
// import 'controllers/cart_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   print('Message received: ${message.notification?.title}');
  //   // Handle notification here
  // });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      initialBinding: BindingController(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
