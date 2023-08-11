import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mario/assets.dart';
import 'package:mario/view/widgets/move_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double right = 0;

  void moveRight() {
    double screenWidth = MediaQuery.of(context).size.width;
    if (right < (screenWidth - 100)) {
      setState(() {
        right += 20;
        isFlipped = false;
      });
    }
    debugPrint('RIGHT! $right');
  }

  void moveLeft() {
    if (right > 90) {
      setState(() {
        right -= 20;
        isFlipped = true;
      });
    }
    debugPrint('RIGHT! $right');
  }

  bool isJump = false;

  void jump() {
    debugPrint('JUMP!');
    setState(() {
      isJump = true;
      Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
          isJump = false;
        });
      });
    });
  }

  bool isFlipped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.blue,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 70.h),
                    child: const SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Text(
                            'Super Mario',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'MARIO',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '0',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'WORLD',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '1-1',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'TIME',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '9999',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    bottom: isJump ? 50 : 0,
                    left: right,
                    child: Transform(
                      transform: Matrix4.identity()
                        ..scale(
                          isFlipped ? -1.0 : 1.0,
                          1.0,
                        ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Image.asset(
                          MyAssets().superMario,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 15,
            color: Colors.lightGreen,
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.brown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MoveButton(onTap: moveLeft, icon: Icons.arrow_back),
                  MoveButton(onTap: jump, icon: Icons.arrow_upward),
                  MoveButton(onTap: moveRight, icon: Icons.arrow_forward),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
