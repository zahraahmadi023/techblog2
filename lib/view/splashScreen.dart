import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'mainScreen.dart';
import '../component/myColors.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds:2)).then((value) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    //TODO:impl
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
            const SpinKitFadingCube(color: SolidColors.primaryColor,
            size: 50,)
          ],
        ),
      ),
    );
  }
}

