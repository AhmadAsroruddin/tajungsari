import 'package:flutter/material.dart';
import 'package:sendang/screen/cardDestination.dart';
import 'package:sendang/shared/navbar.dart';

import 'responsive_widget.dart';
import 'small_screen.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

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
          return Products(
            deviceWidth: deviceWidth,
            deviceMargin: deviceMargin,
            deviceHeight: deviceHeight,
          );
        }
      },
    );
  }
}

class Products extends StatelessWidget {
  const Products({
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
          children: <Widget>[
            Navbar(
              deviceWidth: deviceWidth,
              deviceMargin: deviceMargin,
              name: "GALLERY",
            ),
            CardDestination(
              deviceWidth: deviceWidth,
              deviceHeight: deviceHeight,
              name: "Jagung",
              image: "jagung.jpg",
              desc:
                  "Desa Tajungsari, Tlogowungu, Pati memiliki potensi yang baik untuk pengembangan tanaman jagung. Lingkungan dan iklim yang sesuai, lahan pertanian yang luas dan subur, serta praktik pertanian lokal yang sudah berpengalaman, mendukung keberhasilan budidaya jagung. Selain itu, jagung memiliki potensi pasar yang besar sebagai bahan pangan dan pakan ternak, serta berbagai produk olahan. Dukungan dari pemerintah daerah dan keberagaman produk jagung juga menjadi peluang usaha bagi masyarakat setempat. Dengan memanfaatkan potensi ini, pengembangan pertanian jagung dapat meningkatkan kesejahteraan petani dan mendukung ekonomi lokal.",
            ),
            CardDestination(
              deviceWidth: deviceWidth,
              deviceHeight: deviceHeight,
              name: "Kopi",
              image: "kopi.jpg",
              desc:
                  "Desa Tajungsari, Tlogowungu, Pati memiliki potensi yang menjanjikan untuk pengembangan tanaman kopi. Iklim dan kondisi geografis yang cocok, serta ketinggian tempat yang sesuai, menciptakan lingkungan ideal untuk budidaya kopi. Selain itu, masyarakat di desa telah memiliki pengetahuan dan keterampilan dalam bercocok tanam kopi secara tradisional. Potensi pasar kopi sebagai produk komoditas dan minuman kian meningkat, dan dapat menjadi peluang bagi masyarakat untuk mengembangkan bisnis kopi lokal. Dengan dukungan dari pemerintah dan lembaga terkait, serta upaya pengelolaan yang berkelanjutan, pengembangan kopi di Desa Tajungsari dapat memberikan dampak positif bagi ekonomi lokal dan kesejahteraan masyarakat setempat",
            ),
            CardDestination(
              deviceWidth: deviceWidth,
              deviceHeight: deviceHeight,
              name: "Senggon",
              desc:
                  "Desa Tajungsari, Tlogowungu, Pati memiliki potensi yang menjanjikan untuk pengembangan tanaman kayu sengon (Paraserianthes falcataria). Iklim dan kondisi tanah yang sesuai, serta lahan yang luas, menciptakan lingkungan ideal untuk budidaya kayu sengon. Sengon merupakan salah satu jenis tanaman cepat tumbuh yang digunakan dalam industri kayu, kertas, dan bahan bangunan. Potensi pasar kayu sengon yang tinggi memberikan peluang ekonomi yang menarik bagi masyarakat desa. Biasanya kayu ini dikirim ke kabupaten Temanggung. Dukungan dari pemerintah dan lembaga terkait dalam bentuk pelatihan, pembiayaan, dan teknis budidaya kayu sengon dapat membantu meningkatkan produktivitas dan nilai ekonomi dari tanaman ini. Pengembangan kayu sengon dapat menjadi alternatif yang berkelanjutan untuk meningkatkan kesejahteraan masyarakat desa serta mendukung upaya pelestarian dan pengelolaan sumber daya alam secara berwawasan lingkungan.",
              image: "sengong.jpg",
            ),
            CardDestination(
              deviceWidth: deviceWidth,
              deviceHeight: deviceHeight,
              name: "Cengkeh",
              desc:
                  "Desa Tajungsari, Tlogowungu, Pati memiliki potensi yang menjanjikan untuk pengembangan tanaman cengkeh (Syzygium aromaticum). Iklim dan kondisi tanah yang sesuai, serta ketinggian tempat yang cocok, menciptakan lingkungan ideal untuk budidaya cengkeh. Cengkeh merupakan salah satu tanaman rempah-rempah bernilai ekonomi tinggi dan memiliki permintaan yang stabil di pasar internasional. Potensi pasar cengkeh sebagai bahan dasar dalam industri rempah-rempah, makanan, dan minuman, menawarkan peluang usaha yang menguntungkan bagi masyarakat desa. Pengembangan budidaya cengkeh di Desa Tajungsari dapat memberikan manfaat ekonomi yang signifikan dan mendorong peningkatan kesejahteraan masyarakat setempat. Dukungan dari pemerintah dan lembaga terkait dalam bentuk pelatihan, teknis budidaya, serta akses pasar, dapat membantu mendorong perkembangan potensi cengkeh di desa, sambil menjaga dan melestarikan warisan rempah-rempah yang berharga.",
              image: "cengkeh.jpg",
            )
          ],
        ),
      ),
    );
  }
}
