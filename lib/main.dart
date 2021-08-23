import 'package:flutter/material.dart';
import 'screen/input_page.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFA1ABAA),
        accentColor: Colors.green,
      ),
      home: InputPage(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) =>InputPage(),
      //   '/result':(context)=>Result(),
      // },
    );
  }
}


