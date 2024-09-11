import 'package:flutter/material.dart';
import 'package:flutter_sign_me/dry_widget/space_widget.dart';
import 'package:flutter_sign_me/themes/colors.dart';
import 'package:flutter_sign_me/themes/images_path.dart';

void replacePageWith(BuildContext context, Widget destination) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => destination,
    ),
  );
}

class PopScopeF316 extends StatelessWidget {
  final Function(bool canPop)? onPopInvoked;
  final Widget child;

  const PopScopeF316({
    super.key,
    this.onPopInvoked,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: onPopInvoked,
      child: child,
    );
  }
}

class SmListEmpty extends StatelessWidget {
  const SmListEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(listEmptyImg),
        Text(
          'There’s no transaction',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: smcBlack33,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 0,
            letterSpacing: -0.30,
          ),
        ),
        const Space10(),
        Text(
          'You can pull down to refresh..',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: smcBlack33,
            height: 0,
            letterSpacing: -0.30,
          ),
        )
      ],
    );
  }
}

class LabelValueListItem extends StatelessWidget {
  final String label, value;

  const LabelValueListItem({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '$label\n',
            style: TextStyle(
              color: smcGrey77,
              fontSize: 13,
              height: 0,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: smcGreen,
              fontSize: 15,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}

double getHeight(BuildContext context) => MediaQuery.sizeOf(context).height;

double getWidth(BuildContext context) => MediaQuery.sizeOf(context).width;

class StackBgHeader extends StatelessWidget {
  final Widget body;
  const StackBgHeader({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: getWidth(context),
          height: getHeight(context),
          color: smcGreyE7,
        ),
        Container(
          height: 260,
          width: getWidth(context),
          decoration: BoxDecoration(
            color: smcGreyE7,
            image: const DecorationImage(
              image: AssetImage(bgHeaderImg),
              fit: BoxFit.fill,
            ),
          ),
        ),
        body,
      ],
    );
  }
}
