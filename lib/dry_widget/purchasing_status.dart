import 'package:flutter/material.dart';
import 'package:flutter_sign_me/themes/colors.dart';

class PurchasingStatus extends StatelessWidget {
  const PurchasingStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: ShapeDecoration(
            color: smcWhite,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: smcBlue),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'OPEN',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: smcBlue,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  height: 0,
                  letterSpacing: 0.20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
