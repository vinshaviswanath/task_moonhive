import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:moonhive_task/view/Adminscreen/Inventory/updateitem.dart';
import 'package:moonhive_task/view/Chefscreen/chefscreen.dart';

import 'view/Adminscreen/Menu/updatemenu.dart';
import 'view/Loginscreen/Localstrings.dart';
import 'view/Splashscreen/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBzNG7gMPxuBJ41JD4qt_NUUqIu0NYRiZo",
          appId: "1:331963314568:android:b92d111bfc01b3d2524a3d",
          messagingSenderId: "",
          projectId: "hotelmanagement-99465",
          storageBucket: "hotelmanagement-99465.appspot.com"));

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocalString(),
      locale: Locale(
        'en',
        'US',
      ),
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),routes:{'/Updatemenu':(context) => Updatemenu(),
                                  '/updateInvent':(context) => UpdateInventory(),
                                  '/Chef':(context) => Chef(), },
    );
  }
}

