import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

/// NOTES
/// *******************
/// • Görsel nesnelerin transparan hale dönüşümünü sağlar , 0 ile 1 arasında
/// bir değişim olur. 0 : tamamen görünmez , 1 : tam görünür hale gelir

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<double> alphaAnimasyonDegerleri;

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
    alphaAnimasyonDegerleri =
        Tween(begin: 1.0, end: 0.0).animate(animationController)
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
            Opacity(
              opacity: alphaAnimasyonDegerleri.value,
              //Üretilen değerin arayüzde
              // kullanılması.Animasyon
              // sürecinde üretilen değerler
              // bu özelliği değiştirir. 
              child: Icon(
                Icons.wb_cloudy,
                color: Colors.white,
                size: 128,
              ),
            ),
            Icon(
              Icons.wb_cloudy_outlined,
              color: Colors.green,
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
