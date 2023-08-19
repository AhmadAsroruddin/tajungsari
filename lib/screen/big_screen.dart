import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sendang/shared/theme.dart';

import '../shared/navbar.dart';
import 'responsive_widget.dart';

class BigScreen extends StatefulWidget {
  @override
  _BigScreenState createState() => _BigScreenState();
  static const routeName = '/';
}

class _BigScreenState extends State<BigScreen> {
  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var containerWidth = 13 / 100 * deviceWidth;

    var deviceMargin = ResponsiveWidget.isMediumScreen(context)
        ? (5 / 100 * deviceWidth)
        : containerWidth;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Navbar(
              deviceWidth: deviceWidth,
              deviceMargin: deviceMargin,
              isHome: true,
              name: "BERANDA",
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('agenda').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<DocumentSnapshot> doc = snapshot.data!.docs;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Agenda Terkini",
                          style:
                              TextStyle(fontSize: 36, fontFamily: 'Helvetica'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: deviceWidth * 0.6,
                              height: deviceWidth * 0.3,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(doc[0]['imageUrl']),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          doc[0]['judul'],
                          style: blackTextStyle.copyWith(fontSize: 30),
                        )
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            Text(
              "PUSAT INFORMASI DESA",
              style: blackTextStyle.copyWith(fontSize: 36),
            ),
            Container(
              width: deviceWidth * 0.8,
              child: ClipRRect(
                child: Image.asset("asset/img/denda.png"),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: deviceWidth * 0.8,
              child: ClipRRect(
                child: Image.asset("asset/img/info_pelayanan.png"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
