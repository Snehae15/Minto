import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState(){
    super.initState();
    Timer(Duration(seconds: 4),
            ()=>Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Log())));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: new Color(0xffc29a5c),
              gradient: LinearGradient(
                colors: [new Color(0xffcca550), new Color(0xffc79518)],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50, // Adjust the radius as per your requirement
                backgroundColor: Colors.grey[300],
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: ClipOval(
                    child: Image.asset(
                      'asset/logo.png', // Replace with your logo image path
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
              ),
              // Text(
              //   FlutterI18n.translate(context, "splash screen"),
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 24.0,
              //   ),
              // ),

            ],
          ),
        ],
      ),
    );
  }
}