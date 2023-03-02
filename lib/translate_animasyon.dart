import 'package:flutter/material.dart';

class TranslateDeneme extends StatefulWidget {
  const TranslateDeneme({Key? key}) : super(key: key);

  @override
  State<TranslateDeneme> createState() => _TranslateDenemeState();
}

class _TranslateDenemeState extends State<TranslateDeneme>
    with TickerProviderStateMixin {
//Görsel nesnenin döndürülme işlemidir.
// • Radyan cinsinden dönme işlemi sağlanır.
// • Belirlenen açı değerleri arasında dönme animasyonu gerçekleşir

  late AnimationController animationController;

  late Animation<double> translateAnimasyonDegerleri;

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
    translateAnimasyonDegerleri = Tween(
      begin: 800.0,
      end: 0.0,
    ).animate(animationController)
      ..addListener(() {
        setState(() {
          //Bu değerlerin arayüzde yenilenmesi
          // için boş state metodu oluşturulur.
        });
      });

    animationController.forward();
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
              size: 128,
            ),
            Transform.translate(
              offset: Offset(
                0.0,
                translateAnimasyonDegerleri.value, 
              ),
              child: Text(
                "Hava Durumu ",
                style: TextStyle(color: Colors.white, fontSize: 36),
              ),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
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
