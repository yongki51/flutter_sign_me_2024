import 'package:flutter/material.dart';
import 'package:flutter_sign_me/themes/colors.dart';
import 'package:flutter_sign_me/themes/images_path.dart';

class GetImageEform extends StatelessWidget {
  final String type;
  const GetImageEform({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case 'ijin kerja':
        return Image.asset(icIjinKerjaImg);
      case 'fit out':
        return Image.asset(icFitOutImg);
      case 'regular':
        return Image.asset(icRegularImg);
      case 'ovt':
        return Image.asset(icOvtImg);
      default:
        return Image.asset(icIjinKerjaImg);
    }
  }
}

class GetStatusEform extends StatelessWidget {
  final String status;
  const GetStatusEform({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case '1':
        return const StatusEform(
          color: Color(0x3309CA34),
          text: 'APPROVED',
          textColor: Color(0xFF09C933),
        );
      case '2':
        return StatusEform(
          color: const Color(0x33777777),
          text: 'REJECTED',
          textColor: smcGrey55,
        );
      case '3':
        return Container(
          width: 100,
          height: 20,
          decoration: ShapeDecoration(
            color: smcWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(width: 2, color: Color(0x33555555)),
            ),
          ),
          child: Center(
            child: Text(
              'CLOSED',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: smcGrey55,
                fontSize: 10,
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
        );
      case 'ovt':
        return Image.asset(icOvtImg);
      default:
        return Image.asset(icIjinKerjaImg);
    }
  }
}

class StatusEform extends StatelessWidget {
  final Color color;
  final String text;
  final Color textColor;

  const StatusEform({
    super.key,
    required this.color,
    required this.text,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 20,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Center(
        child: Text(
          text.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: 10,
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
      ),
    );
  }
}
