import 'package:flutter/material.dart';
import 'package:form/regisf.dart';
import 'package:splashscreen/splashscreen.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 5,
        navigateAfterSeconds:regisf(),
        title: Text(
          'Registration Form',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              color: Colors.black),
        ),
        image: new Image.asset('image/logo.png'),
        photoSize: 140.0,
        backgroundColor: Color(0xff412f7b),
        styleTextUnderTheLoader: new TextStyle(),
        loaderColor: Colors.grey
   );

  }
}







