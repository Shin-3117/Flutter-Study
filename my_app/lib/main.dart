import 'package:flutter/material.dart';
import 'package:my_app/gradient_container.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('appBar'),
          backgroundColor: Colors.deepPurple,
        ),
        body: GradientContainer(),
      ),
    ),
  );
}
