import 'package:flutter/material.dart';
import 'package:zippy/provider/carPoolingProvider.dart';
import 'package:zippy/loginModule/signuppage.dart';
import 'package:provider/provider.dart';
import 'home/homePage.dart';
import 'routes/refreshPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return CarPoolingProvider();
          },
        ),
      ],
      child: MaterialApp(
        title: 'U.O.W',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        initialRoute: '/init',
        routes: {
          // '/init': (context) => RefreshPage(),
          '/init': (context) => RefreshPage(),
          '/sign': (context) => SignUp(),
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}
