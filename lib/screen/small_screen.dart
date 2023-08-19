import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../shared/theme.dart';

class SmallScreen extends StatelessWidget {
  const SmallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("TEST")));
  }
}

Widget _menuTile(String title) {
  return ListTile(
    title: Text(
      title,
      style: whiteTextStyle,
    ),
    trailing: const Icon(
      Icons.arrow_forward_ios,
      color: Colors.white,
    ),
  );
}

Widget _pilarItem(String path) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Image.asset(path),
  );
}
