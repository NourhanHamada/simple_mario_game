import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mario/assets.dart';
import 'package:mario/view/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (BuildContext context) {
              return const HomeScreen();
            },
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          MyAssets().splash,
          fit: BoxFit.fitHeight,
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }
}
