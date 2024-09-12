import 'package:flutter/material.dart';
import 'package:flutter_sign_me/dry_widget/space_widget.dart';
import 'package:flutter_sign_me/global.dart';
import 'package:flutter_sign_me/pages/dashboard_page.dart';
import 'package:flutter_sign_me/themes/colors.dart';
import 'package:flutter_sign_me/themes/images_path.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          bgFullImg,
          width: getWidth(context),
          height: getHeight(context),
          fit: BoxFit.cover,
        ),
        Positioned(
          top: MediaQuery.sizeOf(context).height * 0.2,
          child: SizedBox(
            width: getWidth(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset(logoImg)],
            ),
          ),
        ),
        Positioned(
          top: getHeight(context) * 0.4,
          bottom: 0,
          child: SizedBox(
            height: getHeight(context),
            width: getWidth(context),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sign In',
                            style: TextStyle(
                              color: smcWhite,
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Please fill in the credentials',
                            style: TextStyle(color: smcWhite, fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    const Space(height: 13),
                    Container(
                      width: double.infinity,
                      decoration: ShapeDecoration(
                        color: smcGreyF6,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                      ),
                      child: Column(
                        children: [
                          const Space(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.apartment_rounded),
                                    hintText: "Company ID...",
                                  ),
                                ),
                                const Space(height: 20),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.person_rounded),
                                    hintText: "User ID...",
                                  ),
                                ),
                                const Space(height: 20),
                                TextFormField(
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.lock_rounded),
                                    hintText: "Password...",
                                    suffixIcon: Icon(Icons.visibility_rounded),
                                  ),
                                ),
                                const Space(height: 30),
                                const ButtonLogin(),
                                SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.13,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Space10(),
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => replacePageWith(context, const DashboardPage()),
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(smcBlack),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        child: Text(
          'Login',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: smcWhite,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
