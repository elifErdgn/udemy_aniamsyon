import 'package:flutter/material.dart';

class ScaleDeneme extends StatefulWidget {
  const ScaleDeneme({Key? key}) : super(key: key);

  @override
  State<ScaleDeneme> createState() => _ScaleDenemeState();
}

class _ScaleDenemeState extends State<ScaleDeneme>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<double> scaleAnimasyonDegerleri;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    animationController = AnimationController(
        duration: Duration(
          microseconds: 3000,
        ),
        vsync: this);

    /// vsync ( Vertical Synchronization ) , görüntü oranını monitörün
    // yenilenme hızıyla eşleştirmenize yardımcı olan bir seçenektir , bu
    // sayede ekranda meydana gelen kırılmaların önüne geçilir

    // begin başlangıç ,end bitiş
    // değerini temsil eder
    scaleAnimasyonDegerleri =
        Tween(begin: 128.0, end: 50.0).animate(animationController)
          ..addListener(() {
            setState(() {
              //Bu değerlerin arayüzde yenilenmesi
              // için boş state metodu oluşturulur.
            });
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
            Icon(
              Icons.wb_cloudy_outlined,
              color: Colors.green,
              size: scaleAnimasyonDegerleri.value,
            ),
            Text(
              "Hava Durumu ",
              style: TextStyle(color: Colors.white, fontSize: 36),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  animationController.forward();
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
