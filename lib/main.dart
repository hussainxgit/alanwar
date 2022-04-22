import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'pages/trips/create_trip_form.dart';
import 'pages/mainPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: const FirebaseOptions(
        apiKey: "AIzaSyBx8vygo5t_cuwHX3hVZ3RZz4qjzYGkCbs",
        authDomain: "alanwar-c0dc7.firebaseapp.com",
        projectId: "alanwar-c0dc7",
        storageBucket: "alanwar-c0dc7.appspot.com",
        messagingSenderId: "513953279230",
        appId: "1:513953279230:web:246bf6c16c41cce9d749af",
        measurementId: "G-ZLZFDS4X7P"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Al Anwar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PageController(),
    );
  }
}

class PageController extends StatelessWidget {
  const PageController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MainPage();
  }
}
