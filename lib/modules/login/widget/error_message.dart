import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showLongToast({required String msg}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    fontSize: 13.0,
    timeInSecForIosWeb: 1,
    backgroundColor: Color(0xffF8D7DA),
    textColor: Color(0xff84202A),
    gravity: ToastGravity.BOTTOM,
  );
}
