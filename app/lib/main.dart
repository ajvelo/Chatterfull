// @dart=2.9

import 'package:app/screens/auth_screen.dart';
import 'package:app/screens/chat_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
              title: 'Chatterfull',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primarySwatch: Colors.pink,
                  backgroundColor: Colors.pink,
                  accentColor: Colors.deepPurple,
                  accentColorBrightness: Brightness.dark,
                  elevatedButtonTheme: ElevatedButtonThemeData(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.pink,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0)))),
                  textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                          primary: Colors.pink,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0))))),
              home: StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Scaffold(
                      appBar: AppBar(
                        title: Text('Chatterfull'),
                      ),
                    );
                  } else {
                    if (snapshot.hasData) {
                      return ChatScreen();
                    } else {
                      return AuthScreen();
                    }
                  }
                },
              ),
              navigatorObservers: [
                FirebaseAnalyticsObserver(analytics: analytics),
              ]);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
