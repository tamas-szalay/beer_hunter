import 'package:beer_hunter/app.dart';
import 'package:beer_hunter/core/config.dart';
import 'package:flutter/material.dart';

void main() async {
  await configureApp();
  runApp(App());
}
