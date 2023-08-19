import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:sendang/screen/admin_screen.dart';
import 'package:sendang/shared/navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../router/router_delegate.dart';
import 'responsive_widget.dart';
import 'small_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
          return Login(
            deviceWidth: deviceWidth,
            deviceMargin: deviceMargin,
            deviceHeight: deviceHeight,
          );
        }
      },
    );
  }
}

class Login extends StatefulWidget {
  Login({
    super.key,
    required this.deviceWidth,
    required this.deviceMargin,
    required this.deviceHeight,
  });

  final double deviceWidth;
  final double deviceMargin;
  final double deviceHeight;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  bool? isLogin = false;

  @override
  void initState() {
    super.initState();
    checkIfLogin();
  }

  Future<void> checkIfLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      isLogin = pref.getBool("isLogin")!;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("ini di main $isLogin");

    return Scaffold(
      body: Column(
        children: <Widget>[
          Navbar(
            deviceWidth: widget.deviceWidth,
            deviceMargin: widget.deviceMargin,
            name: "Login",
          ),
          isLogin == false
              ? LoginPage(
                  deviceWidth: widget.deviceWidth,
                  deviceHeight: widget.deviceHeight,
                  emailController: _emailController,
                  passwordController: _passwordController,
                )
              : AdminScreen()
        ],
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
    required this.deviceWidth,
    required this.deviceHeight,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _emailController = emailController,
        _passwordController = passwordController;

  final double deviceWidth;
  final double deviceHeight;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: deviceWidth * 0.5,
      child: Column(
        children: <Widget>[
          Container(
            height: deviceWidth * 0.15,
            width: deviceHeight * 0.15,
            padding: const EdgeInsets.only(top: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
            ),
            child: Center(
              child: Image.asset('asset/img/logo.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                  hintText: 'Enter valid mail id as abc@gmail.com'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ' Kata Sandi',
                  hintText: 'Masukkan kata sandi aman Anda'),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final FluroRouter router = Flurorouter.router;
              SharedPreferences pref = await SharedPreferences.getInstance();
              if (_emailController.text == "Desa Tajungsari" ||
                  _passwordController.text == "tajungsari2023") {
                await pref.setBool("isLogin", true);
                // ignore: use_build_context_synchronously
                router.navigateTo(context, '/login',
                    transition: TransitionType.fadeIn);
                print("benar");
              } else {
                pref.setBool("isLogin", false);
                print("Salah");
              }
            },
            child: const Text("MASUK"),
          )
        ],
      ),
    );
  }
}
