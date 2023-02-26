import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({Key? key, required this.path}) : super(key: key);

  final String path;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(path, repeat: false);
  }
}
