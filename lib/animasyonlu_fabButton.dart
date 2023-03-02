import 'dart:math';

import 'package:flutter/material.dart';

class FButtonTasarim extends StatefulWidget {
  const FButtonTasarim({Key? key}) : super(key: key);

  @override
  State<FButtonTasarim> createState() => _FButtonTasarimState();
}

class _FButtonTasarimState extends State<FButtonTasarim>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<double> scaleAnimasyonDegerli;
  late Animation<double> rotateAnimasyonDegerli;

  bool fabDurum = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 200,
        ));

    scaleAnimasyonDegerli = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(animationController)
      ..addListener(() {
        setState(() {});
      });

    rotateAnimasyonDegerli =
        Tween(begin: 0.0, end: pi / 4).animate(animationController)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [],
        ),
      ),
      floatingActionButton: Column(
        children: [
          Transform.scale(
            scale: scaleAnimasyonDegerli.value,
            child: FloatingActionButton(
              onPressed: () {
                print("Fab 2 tıklandı");
              },
              tooltip: "FAB 2",
              backgroundColor: Colors.yellow,
              child: Icon(Icons.photo_camera),
            ),
          ),
          Transform.scale(
            scale: scaleAnimasyonDegerli.value,
            child: FloatingActionButton(
              onPressed: () {
                print("Fab 1 tıklandı");
              },
              tooltip: "FAB 2",
              backgroundColor: Colors.orange,
              child: Icon(Icons.photo_camera),
            ),
          ),
          Transform.rotate(
            angle: rotateAnimasyonDegerli.value,
            child: FloatingActionButton(
              onPressed: () {
                print("Fab 3 tıklandı");

                if (fabDurum) {
                  animationController.reverse();
                  fabDurum = false;
                } else {
                  animationController.forward();
                  fabDurum = true;
                }
              },
              tooltip: "FAB Main",
              backgroundColor: Colors.red,
              child: Icon(Icons.photo_camera),
            ),
          ),
        ],
      ),
    );
  }
}
