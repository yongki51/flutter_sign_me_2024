import 'package:flutter/material.dart';
import 'package:flutter_sign_me/themes/colors.dart';

class EformPage extends StatelessWidget {
  const EformPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.chevron_left_rounded),
        title: Text(
          '7 Item(s) Purchasing',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: smcWhite,
            fontSize: 22,
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
        backgroundColor: smcGreen,
        foregroundColor: smcWhite,
      ),
      body: const Column(
        children: [
          Center(
            child: Text('EformPage'),
          ),
        ],
      ),
    );
  }
}
