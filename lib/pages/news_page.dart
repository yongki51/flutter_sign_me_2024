import 'package:flutter/material.dart';
import 'package:flutter_sign_me/dry_widget/space_widget.dart';
import 'package:flutter_sign_me/global.dart';
import 'package:flutter_sign_me/pages/dashboard_page.dart';
import 'package:flutter_sign_me/themes/colors.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return StackBgHeader(
      body: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: InkWell(
              onTap: () => replacePageWith(context, const DashboardPage()),
              child: const Icon(Icons.chevron_left_rounded),
            ),
            title: Text(
              'News',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: smcWhite,
                fontSize: 22,
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            foregroundColor: smcWhite,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  width: getWidth(context),
                  height: getHeight(context) * 0.25,
                  decoration: ShapeDecoration(
                    image: const DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/76x76"),
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const Space10(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Maintenance for Swimming Pool',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 18,
                        color: smcBlack16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.30,
                        height: 0,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                    ),
                    const Space(height: 5),
                    Text(
                      '25 Nov 2022',
                      style: TextStyle(
                        color: smcGrey99,
                        fontSize: 16,
                        letterSpacing: -0.30,
                        height: 0,
                      ),
                    ),
                    const Space10(),
                    Text(
                      'Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet, consectetur adipiscing elit. In aliquet malesuada ex',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: smcBlack33,
                        fontSize: 16,
                        height: 0,
                        letterSpacing: -0.30,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
