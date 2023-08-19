import 'package:flutter/material.dart';

class Custom extends StatelessWidget {
  const Custom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Opacity(
            opacity: 0.8,
            child: Image.asset(
              "asset/img/logo.png",
              cacheWidth: 300,
              cacheHeight: 350,
              width: 250,
            ),
          ),
          const Text(
            "SELAMAT DATANG",
            style: TextStyle(
                fontFamily: 'Helvetica',
                fontSize: 36,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          const Text(
            "Desa Tajungsari, Kecamatan Tlogowungu, Kabupaten Pati",
            style: TextStyle(
                fontFamily: 'Helvetica', fontSize: 18, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
