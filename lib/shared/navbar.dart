import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../router/router_delegate.dart';

import 'custom.dart';
import '../screen/responsive_widget.dart';

class Navbar extends StatelessWidget {
  const Navbar(
      {super.key,
      required this.deviceWidth,
      required this.deviceMargin,
      this.isHome = false,
      required this.name});

  final double deviceWidth;
  final double deviceMargin;
  final bool isHome;
  final String name;

  @override
  Widget build(BuildContext context) {
    final FluroRouter router = Flurorouter.router;
    return LayoutBuilder(
      builder: (context, constraints) {
        final double scaleFactorTitle =
            constraints.maxWidth > constraints.maxHeight
                ? constraints.maxHeight / 550
                : constraints.maxWidth / 550;

        final double scaleFactorNav =
            constraints.maxWidth > constraints.maxHeight
                ? constraints.maxHeight / 1400
                : constraints.maxWidth / 1400;
        final double fontSizeTitle = 16 * scaleFactorTitle;
        final double fontSizeNav = 16 * scaleFactorNav;
        return Container(
          decoration: isHome
              ? const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("asset/img/kopi.png"),
                    fit: BoxFit.fill,
                  ),
                )
              : null,
          width: deviceWidth,
          height: isHome
              ? MediaQuery.of(context).size.height
              : MediaQuery.of(context).size.height * 0.2,
          child: Container(
            margin: EdgeInsets.only(left: deviceMargin, right: deviceMargin),
            child: Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Desa Tajungsari",
                            style: TextStyle(
                              fontFamily: 'Helvetica',
                              fontSize: fontSizeTitle,
                              color: isHome ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            router.navigateTo(context, '/',
                                transition: TransitionType.fadeIn);
                          },
                          child:
                              _menuItem("BERANDA", name, isHome, fontSizeNav),
                        ),
                        GestureDetector(
                          onTap: () {
                            router.navigateTo(context, '/about',
                                transition: TransitionType.fadeIn);
                          },
                          child:
                              _menuItem("TENTANG", name, isHome, fontSizeNav),
                        ),
                        GestureDetector(
                          onTap: () {
                            router.navigateTo(context, '/agenda',
                                transition: TransitionType.fadeIn);
                          },
                          child: _menuItem("AGENDA", name, isHome, fontSizeNav),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            router.navigateTo(context, '/produk',
                                transition: TransitionType.fadeIn);
                          },
                          child: _menuItem("PRODUK", name, isHome, fontSizeNav),
                        ),
                        GestureDetector(
                          onTap: () {
                            router.navigateTo(
                              context,
                              '/gallery',
                              transition: TransitionType.fadeIn,
                            );
                          },
                          child: _menuItem("GALERI", name, isHome, fontSizeNav),
                        ),
                        GestureDetector(
                            onTap: () {
                              router.navigateTo(
                                context,
                                '/login',
                                transition: TransitionType.fadeIn,
                              );
                            },
                            child: _menuItem(
                                "LOGIN ADMIN", name, isHome, fontSizeNav)),
                      ],
                    ),
                  ),
                  isHome
                      ? Align(
                          alignment: ResponsiveWidget.isMediumScreen(context)
                              ? Alignment.topCenter
                              : Alignment.topLeft,
                          child: const Padding(
                            padding: EdgeInsets.only(top: 150),
                            child: Custom(),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Padding _menuItem(String title, String name, bool isHome, double fontSize) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 20.0,
      right: 20.0,
    ),
    child: Text(
      title,
      style: TextStyle(
        height: 3.2,
        fontSize: fontSize,
        color: isHome ? Colors.white : Colors.black,
        fontWeight: title == name ? FontWeight.bold : FontWeight.normal,
      ),
    ),
  );
}
