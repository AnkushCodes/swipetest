import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:task/home_page.dart';
import 'package:task/popup_menu.dart';
import 'package:task/services/api.dart';
import 'package:task/theme.dart';
import 'package:task/welcome_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              'YourChallange',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            actions: [
              PopMenu(),
              SizedBox(
                width: 20,
              )
            ],
          ),
          body: FutureBuilder(
            future: Api.getData(),
            builder: (BuildContext context, AsyncSnapshot<Welcome> snapShot) {
              if (snapShot.hasData) {
                return HomePage(
                  welcome: snapShot.data as Welcome,
                );
              } else if (snapShot.hasError) {
                return Center(
                  child: Text('Somthing went Wrong try again'),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          )),
    );
  }
}
