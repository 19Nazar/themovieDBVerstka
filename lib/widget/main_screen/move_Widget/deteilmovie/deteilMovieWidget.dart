import 'package:flutter/material.dart';

class DeteilMovieWidget extends StatefulWidget {
  final movieID;
  const DeteilMovieWidget({required this.movieID, super.key});

  @override
  State<DeteilMovieWidget> createState() => _DeteilMovieWidgetState();
}

class _DeteilMovieWidgetState extends State<DeteilMovieWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Innfo'),
      ),
    );
  }
}
