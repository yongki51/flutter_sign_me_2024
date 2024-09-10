import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  final double height;
  const Space({super.key, required this.height});

  @override
  Widget build(BuildContext context) => SizedBox(height: height);
}

class Space10 extends StatelessWidget {
  const Space10({super.key});

  @override
  Widget build(BuildContext context) => const Space(height: 10);
}

class VerSpace extends StatelessWidget {
  final double width;
  const VerSpace({super.key, required this.width});

  @override
  Widget build(BuildContext context) => SizedBox(width: width);
}

class VerSpace10 extends StatelessWidget {
  const VerSpace10({super.key});

  @override
  Widget build(BuildContext context) => const VerSpace(width: 10);
}
