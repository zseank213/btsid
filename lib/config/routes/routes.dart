import 'package:btsid/modules/home/page/home_view.dart';
import 'package:flutter/material.dart';
import 'package:btsid/lib.dart';

const routeLoginPage = "route_login_page";
const routeLoginView = "route_login_view";
const routeRegisterView = "route_register_view";
const routeRegisterPage = "route_register_page";

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routeRegisterPage:
      return MaterialPageRoute(
        builder: (context) => const RegisterPage(),
      );
  }

  return MaterialPageRoute(
    builder: (context) => const LoginPage(),
  );
}
