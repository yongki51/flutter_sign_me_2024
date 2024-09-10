import 'package:flutter/material.dart';
import 'package:flutter_sign_me/themes/colors.dart';

class LineThick extends StatelessWidget {
  final double? thickness;
  const LineThick({
    super.key,
    this.thickness,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(thickness: thickness, color: smcGreyEc);
  }
}

class LineThick2 extends StatelessWidget {
  const LineThick2({super.key});

  @override
  Widget build(BuildContext context) {
    return const LineThick(thickness: 2);
  }
}

class LineThick5 extends StatelessWidget {
  const LineThick5({super.key});

  @override
  Widget build(BuildContext context) {
    return const LineThick(thickness: 5);
  }
}
