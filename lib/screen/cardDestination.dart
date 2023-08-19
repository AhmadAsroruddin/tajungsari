import 'package:flutter/material.dart';

class CardDestination extends StatelessWidget {
  CardDestination(
      {super.key,
      required this.deviceWidth,
      required this.deviceHeight,
      required this.name,
      required this.desc,
      required this.image});

  final double deviceWidth;
  final double deviceHeight;

  String name;
  String image;
  String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: deviceHeight * 0.01),
      child: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 10,
          child: SizedBox(
            width: deviceWidth * 0.5,
            child: Column(
              children: <Widget>[
                Container(
                  width: deviceWidth * 0.5,
                  height: deviceHeight * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage("asset/img/$image"),
                        fit: BoxFit.cover),
                  ),
                ),
                Text(
                  name,
                  style: const TextStyle(fontSize: 30),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(desc),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
