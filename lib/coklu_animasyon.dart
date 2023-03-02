import 'package:flutter/material.dart';

class cokluAnimasyon extends StatefulWidget {
  const cokluAnimasyon({Key? key}) : super(key: key);

  @override
  State<cokluAnimasyon> createState() => _cokluAnimasyonState();
}

class _cokluAnimasyonState extends State<cokluAnimasyon>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> translateAnimasyonDegerleri;
  late Animation<double> scaleAnimasyonDegerleri;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: Duration(
          microseconds: 1000,
        ),
        vsync: this);

    translateAnimasyonDegerleri = Tween(
      begin: 0.0,
      end: 25.0,
    ).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      });

    scaleAnimasyonDegerleri =
        Tween(begin: 128.0, end: 250.0).animate(animationController)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController
        .dispose(); // Uygulama arkaplana geçtiğinde animasyon durur.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          children: [
            Text(
              "Hava Durumu ",
              style: TextStyle(color: Colors.white, fontSize: 36),
            ),
            Transform.translate(
              offset: Offset(
                0.0,
                translateAnimasyonDegerleri.value,
              ),
              child: Icon(
                Icons.wb_cloudy_outlined,
                color: Colors.green,
                size: scaleAnimasyonDegerleri.value,
              ),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  animationController.repeat(reverse: true);
                },
                child: Text("BAŞLA",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    )),
                style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
