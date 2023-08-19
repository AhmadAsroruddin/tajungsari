import 'dart:js';

import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:sendang/screen/about_screen.dart';
import 'package:sendang/screen/big_screen.dart';
import 'package:sendang/screen/events_screen.dart';
import 'package:sendang/screen/gallery_screen.dart';
import 'package:sendang/screen/login_screen.dart';
import 'package:sendang/screen/products_screen.dart';
import 'package:sendang/screen/responsive_widget.dart';
import 'package:sendang/screen/small_screen.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  

  static void setupRouter() {
    router.define(
      '/',
      handler: Handler(
          handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
              ResponsiveWidget(
                  bigScreen: BigScreen(), smallScreen: const SmallScreen())),
    );

    router.define(
      '/about',
      handler: Handler(
          handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
              const AboutScreen()),
    );

    router.define(
      '/agenda',
      handler: Handler(
          handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
              const AgendaScreen()),
    );

    router.define(
      '/gallery',
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
            const GalleryScreen(),
      ),
    );
    router.define(
      '/produk',
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
            const ProductsScreen(),
      ),
    );
    router.define(
      '/login',
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
            LoginScreen(),
      ),
    );
  }
}
