import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sendang/screen/small_screen.dart';
import 'package:sendang/shared/navbar.dart';

import 'responsive_widget.dart';

class AgendaScreen extends StatelessWidget {
  const AgendaScreen({super.key});

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
          return Agenda(
            deviceWidth: deviceWidth,
            deviceMargin: deviceMargin,
            deviceHeight: deviceHeight,
          );
        }
      },
    );
  }
}

class Agenda extends StatelessWidget {
  const Agenda({
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
      body: ListView(
        children: <Widget>[
          Navbar(
            deviceWidth: deviceWidth,
            deviceMargin: deviceMargin,
            name: "AGENDA",
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('agenda').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Container();
              } else {
                List<DocumentSnapshot> docs = snapshot.data!.docs;
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.07),
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          color: const Color.fromRGBO(37, 37, 37, 1),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: deviceHeight * 0.35,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: NetworkImage(docs[index]['imageUrl'],
                                        scale: 1),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      docs[index]['judul'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      height: deviceHeight * 0.02,
                                    ),
                                    Test(
                                      icon: Icons.access_alarm,
                                      text: docs[index]['tanggal'],
                                    ),
                                    Test(
                                      icon: Icons.add_location,
                                      text: docs[index]['lokasi'],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class Test extends StatelessWidget {
  Test({
    super.key,
    required this.icon,
    required this.text,
  });

  IconData icon;
  String text;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(bottom: 5),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(17, 17, 17, 1),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            Text(
              text,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
