import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:sendang/screen/about_screen.dart';
import 'package:sizer/sizer.dart';
import './router/router_delegate.dart';
import './screen/big_screen.dart';
import './screen/responsive_widget.dart';
import './screen/small_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main()async {
  Flurorouter.setupRouter(); // Mengatur routing menggunakan Fluro
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final FluroRouter router = Flurorouter.router;

    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            // is not restarted.
            fontFamily: 'Quicksands',
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: router.generator,
          initialRoute: '/',
          routes: {
            '/': (context) => ResponsiveWidget(
                bigScreen: BigScreen(), smallScreen: const SmallScreen()),
            '/about': (context) => AboutScreen()
          },
        );
      },
    );
  }
}
