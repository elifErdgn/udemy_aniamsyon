import 'package:flutter/material.dart';

class digerOzellikler extends StatefulWidget {
  const digerOzellikler({Key? key}) : super(key: key);

  @override
  State<digerOzellikler> createState() => _digerOzelliklerState();
}

class _digerOzelliklerState extends State<digerOzellikler>
    with TickerProviderStateMixin {
//Görsel nesnenin döndürülme işlemidir.
// • Radyan cinsinden dönme işlemi sağlanır.
// • Belirlenen açı değerleri arasında dönme animasyonu gerçekleşir

  late AnimationController animationController;

  late Animation<double> ivmeOlusturma;

  @override
  void initState() {
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
    /// *****************
    //• Görsel nesneye gerçek hayatta olduğu gibi hızlanma ve yavaşlama etkisi
    // verilebilir
    ivmeOlusturma = Tween(
      begin: 0.0,
      end: 25.0,
    ).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut))
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
                ivmeOlusturma.value,
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
                onPressed: () {
                  animationController.repeat(reverse: false);
                  //  reverse : false => yapılan işlemin son haline geldikten sonra
                  // başa dönerek işlemi tekrarlama.
                  /// ****
                  // reverse : true => yapılan işlemin son haline geldikten sonra
                  // geriye doğru işlem yapma şeklinde tekrarlam
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
