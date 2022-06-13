import 'package:flutter/material.dart';
import 'package:btsid/lib.dart';

InputDecoration textInputDecoration([String labelText = "", String hintText = ""]) {
  return InputDecoration(
    prefixIcon: Icon(
      Icons.person,
      size: 20,
    ),
    labelText: labelText,
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(19, 7, 20, 0),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(19.5),
      borderSide: const BorderSide(
        width: 1,
        color: Color(0xffE9E9E9),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(19.5),
      borderSide: const BorderSide(
        width: 1,
        color: Color(0xffE9E9E9),
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(19.5),
      borderSide: const BorderSide(color: Colors.red, width: 1.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(19.5),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1.0,
      ),
    ),
    errorStyle: const TextStyle(
      backgroundColor: Colors.transparent,
      fontSize: 10.0,
      color: Color(0xffFF494A),
      fontWeight: FontWeight.w600,
    ),
  );
}

InputDecoration textInputDecorationEmail([String labelText = "", String hintText = ""]) {
  return InputDecoration(
    prefixIcon: Icon(
      Icons.email,
      size: 20,
    ),
    labelText: labelText,
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(19, 7, 20, 0),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(19.5),
      borderSide: const BorderSide(
        width: 1,
        color: Color(0xffE9E9E9),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(19.5),
      borderSide: const BorderSide(
        width: 1,
        color: Color(0xffE9E9E9),
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(19.5),
      borderSide: const BorderSide(color: Colors.red, width: 1.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(19.5),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1.0,
      ),
    ),
    errorStyle: const TextStyle(
      backgroundColor: Colors.transparent,
      fontSize: 10.0,
      color: Color(0xffFF494A),
      fontWeight: FontWeight.w600,
    ),
  );
}
