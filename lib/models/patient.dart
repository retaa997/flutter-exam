import 'package:flutter/material.dart';

class Patient {
  final String name;
  final String time;
  final String image;
  final String problem;

  Patient(
      {required this.name,
      required this.time,
      required this.image,
      required this.problem});
}
