import 'package:flutter/material.dart';
import 'package:sendang/screen/small_screen.dart';
import 'package:sendang/shared/theme.dart';

import '../shared/navbar.dart';
import 'cardDestination.dart';
import 'responsive_widget.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const routeName = '/about';

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;
    var containerWidth = 13 / 100 * deviceWidth;

    var deviceMargin = ResponsiveWidget.isMediumScreen(context)
        ? (5 / 100 * deviceWidth)
        : containerWidth;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 800) {
          return const SmallScreen();
        } else {
          return About(
              deviceWidth: deviceWidth,
              deviceMargin: deviceMargin,
              deviceHeight: deviceHeight);
        }
      },
    );
  }
}

class About extends StatelessWidget {
  const About({
    super.key,
    required this.deviceWidth,
    required this.deviceMargin,
    required this.deviceHeight,
  });

  final double deviceWidth;
  final double deviceMargin;
  final double deviceHeight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Navbar(
              deviceWidth: deviceWidth,
              deviceMargin: deviceMargin,
              name: "ABOUT",
            ),
            Padding(
              padding: const EdgeInsets.all(90.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: deviceHeight * 0.5,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("asset/img/about.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: deviceWidth * 0.02,
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Tentang :",
                                  style: TextStyle(
                                      fontFamily: 'Helvetica',
                                      fontSize: 30,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              SizedBox(
                                height: deviceHeight * 0.01,
                              ),
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "DESA TAJUNGSARI",
                                  style: TextStyle(
                                      fontFamily: 'Helvetica',
                                      fontSize: 30,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Rabu, 13/07/2023 - KKN TIM II UNDIP 2022/2023 (Riska Nurul A.)",
                                  style: greyTextStyle,
                                ),
                              ),
                              SizedBox(
                                height: deviceHeight * 0.03,
                              ),
                              const Text(
                                "Desa ini menawarkan destinasi wisata alam dan wisata religi. Selain menawarkan wisata yang memanjakan mata dengan harga yang terjangkau, desa ini juga memiliki potensi sumber daya alam yang berlimpah dengan kualitas unggul",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                height: deviceHeight * 0.01,
                              ),
                              const Text(
                                "Desa ini menawarkan destinasi wisata yang memanfaatkan keindahan alam sebagai daya tarik bagi penduduk setempat maupun wisatawan luar desa seperti Air Terjun Tretes. Selain wisata alam, di sini juga terdapat wisata religi yaitu Makam Nyai Ageng Kenduruan. Makam tersebut sudah dikeramatkan oleh masyarakat sekitar, dan sudah lama dikunjungi untuk berdoa dan berziarah.",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                height: deviceHeight * 0.01,
                              ),
                              const Text(
                                "Selain menawarkan wisata yang memanjakan mata dengan harga yang terjangkau, desa ini juga memiliki potensi sumber daya alam yang berlimpah dengan kualitas yang bagus. Masyarakat di sini banyak yang memiliki peternakan dan perkebunan. Contoh hasil perkebunan yang diunggulkan di desa ini adalah singkong, kopi, jagung, dan cengkeh. Sedangkan untuk sektor peternakan, didominasi oleh sapi, kambing, ayam, dan lebah. Biasanya, setelah hewan - hewan ini siap untuk diternak akan dikirimkan ke kota dan bisa menjadi salah satu pendapatan desa. ",
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: deviceHeight * 0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Geografis :",
                                  style: TextStyle(
                                      fontFamily: 'Helvetica',
                                      fontSize: 30,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              SizedBox(
                                height: deviceHeight * 0.03,
                              ),
                              const Text(
                                "Desa Tajungsari Tlogowungu adalah satu dari 15 desa yang ada di wilayah Kecamatan Tlogowungu, Kabupaten Pati, Jawa Tengah yang terletak di bagian barat Kabupaten Pati dengan jarak sekitar 14 KM dari pusat pemerintahan Kabupaten Pati dan 9 KM dari pusat pemerintahan Kecamatan Tlogowungu. Luas dari Desa ini adalah 904.404 km² dengan jumlah penduduk 5.989 jiwa.",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                height: deviceHeight * 0.01,
                              ),
                              const Text(
                                "Batas-batas letak geografis desa Tajungsari sebelah utara adalah berbatasan dengan Desa Cabak & Desa Suwatu, sebelah selatan berbatasan dengan Desa Sitiluhur Kec. Gembong, sebelah timur berbatasan dengan Desa Lahar, sedangkan, sebelah barat berbatasan dengan Desa Gunungsari.",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                height: deviceHeight * 0.01,
                              ),
                              const Text(
                                "Desa Tajungsari terdiri dari 32 RT dan 6 RW yang tersebar di 22 Dukuh. Dukuh/dusun yang ada di Tajungsari adalah: Semar, Dukoh, Mangir, Petir, Bontro, Rambutan, Jentir, Doro, Treto, Glenter, Gosari, Jelok, Tajung, Pondok, Randugunting, Tenggeran, Clumun, Beketung, Gajahmati, Krisik, Langsep, dan Ngereng.",
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: deviceWidth * 0.02,
                      ),
                      Expanded(
                        child: Container(
                          height: deviceHeight * 0.5,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("asset/img/peta.png"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Center(
              child: Text(
                "WISATA DESA",
                style: TextStyle(fontSize: 26),
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.05,
            ),
            CardDestination(
              deviceWidth: deviceWidth,
              deviceHeight: deviceHeight,
              name: "Air Terjun Tretes",
              desc:
                  "Air Terjun Tretes merupakan salah satu wisata unggulan yang ada di Desa Tajungsari. Air Terjun yang memiliki ketinggian sekitar 15 meter ini menawarkan panorama yang indah di tengah hutan yang masih asri. Untuk mencapai air terjun ini bisa ditempuh dengan berjalan kaki dari tempat parkir sejauh 1 km. Selain air terjun juga terdapat aliran suangai yang memiliki air sangat bersih dan segar",
              image: "tretes.JPG",
            ),
            CardDestination(
              deviceWidth: deviceWidth,
              deviceHeight: deviceHeight,
              name: "Sendang",
              desc:
                  "Tempat wisata religi ini menawarkan sejumlah destinasi bagi wisatawan. pertama terdapat sebuah tempat makam yang diyakini sebagai makam dari nyai ageng kenduruhan yang merupakan guru dari bupati pati yang pertama, di sini pengunjung dapat melakukan ziarah. Kedua, saat ini tempat ini dikelola oleh desa sebagai tempat wisata sendang atau tempat pemandian. Dengan air yang diambil langsung dari sumber pegunungan yang memberikan air yang segar. Selain itu terdapat juga taman bunga, kolam ikan, hingga tempat kemah",
              image: "sendang.jpg",
            ),
            CardDestination(
              deviceWidth: deviceWidth,
              deviceHeight: deviceHeight,
              name: "Makam Mbah Sentono",
              desc:
                  "Makam Ki Ageng Sentono di Desa Tanjungsari, Kecamatan Tlogowungu, Pati, menarik minat wisatawan luar daerah. Puncak kunjungan biasanya terjadi pada malam satu Sura.Makam tersebut berada di tanah aset milik desa, tepatnya di Dukuh Bontro. Antusiasme pengunjung yang datang membuat pemdes berencana mengembangkannya menjadi salah satu destinasi wisata religi.",
              image: "makam.jpg",
            )
          ],
        ),
      ),
    );
  }
}
