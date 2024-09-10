import 'package:flutter/material.dart';
import 'package:flutter_sign_me/dry_widget/space_widget.dart';
import 'package:flutter_sign_me/global.dart';
import 'package:flutter_sign_me/pages/auth/login_page.dart';
import 'package:flutter_sign_me/themes/colors.dart';
import 'package:flutter_sign_me/themes/images_path.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: smcGreen,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Space(height: 74),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'WELCOME TO',
                    style: TextStyle(
                      color: smcWhite,
                      fontSize: 24,
                      letterSpacing: -0.41,
                    ),
                  ),
                  const Space(height: 17),
                  Image.asset(logoImg),
                ],
              ),
            ),
            Space(height: MediaQuery.sizeOf(context).height * 0.2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Your digital approval for quick response\nanytime and anywhere.',
                style: TextStyle(color: smcWhite, fontSize: 16),
              ),
            ),
            const Space(height: 47),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: smcWhite,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Space(height: 70),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                replacePageWith(context, const LoginPage());
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(smcBlack),
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              child: Text(
                                'LET’S GET STARTED',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: smcWhite,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Copyright © PT. Realta Chakradarma',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: smcGrey77),
                        ),
                        const Space(height: 35),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
