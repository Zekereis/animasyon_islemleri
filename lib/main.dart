import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{

  late AnimationController animasyonKontrol;

  late Animation<double> translateAnimasyonDegerleri;
  late Animation<double> scaleAnimasyonDegerleri;

  @override
  void initState() {
    super.initState();
    animasyonKontrol = AnimationController(duration: Duration(milliseconds: 1000),vsync: this);

    translateAnimasyonDegerleri = Tween(begin: 0.0,end: 25.0)
        .animate(CurvedAnimation(parent: animasyonKontrol, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {
        });
      });

    scaleAnimasyonDegerleri = Tween(begin: 36.0,end: 50.0).animate(animasyonKontrol)
      ..addListener(() {
        setState(() {
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    animasyonKontrol.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(Icons.wb_cloudy,color: Colors.white,size: 128,),
            Transform.translate(offset: Offset(0.0,translateAnimasyonDegerleri.value),
                child: Text("Hava Durumu",style: TextStyle(color: Colors.white,fontSize: scaleAnimasyonDegerleri.value),)),
            SizedBox(width: 250,height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.orange),
                onPressed: (){
                  animasyonKontrol.repeat(reverse: true);
              },
                  child: Text("BAŞLA",style: TextStyle(color: Colors.white,fontSize: 18),),
            ),
              ),
              ],
        ),
      ),
    );
  }
}
