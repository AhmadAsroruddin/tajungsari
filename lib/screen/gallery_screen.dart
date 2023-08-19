import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sendang/shared/navbar.dart';

import 'responsive_widget.dart';
import 'small_screen.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

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
          return Gallery(
            deviceWidth: deviceWidth,
            deviceMargin: deviceMargin,
            deviceHeight: deviceHeight,
          );
        }
      },
    );
  }
}

class Gallery extends StatefulWidget {
  const Gallery({
    super.key,
    required this.deviceWidth,
    required this.deviceMargin,
    required this.deviceHeight,
  });

  final double deviceWidth;
  final double deviceMargin;
  final double deviceHeight;

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Navbar(
            deviceWidth: widget.deviceWidth,
            deviceMargin: widget.deviceMargin,
            name: "GALLERY",
          ),
          Expanded(
            flex: 1,
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('ImageUrls')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print("has data");
                  List<DocumentSnapshot> docs = snapshot.data!.docs;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            3, // Ubah jumlah kolom sesuai preferensi Anda
                        crossAxisSpacing:
                            1.0, // Ganti nilai ini sesuai preferensi Anda (misalnya, 5.0)
                        mainAxisSpacing: 1.0,
                      ),
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        print(docs[index]['url']);

                        return Container(
                          margin: const EdgeInsets.all(8),
                          width: widget.deviceWidth * 0.4,
                          height: widget.deviceHeight * 0.4,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  docs[index]['url'],
                                ),
                                fit: BoxFit.fill),
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  print("waiting");
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  print(snapshot.connectionState);
                  return Center();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
