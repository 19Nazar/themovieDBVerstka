import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error page', style: TextStyle(color: Colors.red)),
      ),
      body: Center(
        child: Text(
          'Some gone wrong',
          style: TextStyle(color: Colors.red, fontSize: 40),
        ),
      ),
    );
    ;
  }
}
