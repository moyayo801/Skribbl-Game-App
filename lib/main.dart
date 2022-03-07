import 'package:drawme/home_screen.dart';
import 'package:drawme/paint_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(color: Color.fromARGB(255, 139, 177, 228),
      child: MaterialApp(
        
        
        title: 'Draw Me',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
         backgroundColor: Color.fromARGB(255, 174, 209, 250),
          primarySwatch: Colors.blue,
        ),
        home: AnimatedSplashScreen(
          splash: Container(
            child: Column(
              children: [Text("SKRIBBL GAME",  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600
                  )),
                  SizedBox(width: 54,)
,                Row(
                  children: [
                    
                    SizedBox(width: 54,height: 10,),
                    LinearPercentIndicator(
                      width: 300,
                      lineHeight: 15,
                      percent: 1,
                      barRadius: Radius.circular(15),
                      progressColor: Color.fromARGB(255, 247, 209, 86),
                      animation:  true,
                      animationDuration: 3000,
                    ),
                  ],
                ),
              ],
            ),
          ),
          nextScreen: HomeScreen(),
        ),
        
      ),
    );
  }
}

