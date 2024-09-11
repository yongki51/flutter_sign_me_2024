import 'package:flutter/material.dart';
import 'package:flutter_sign_me/dry_widget/space_widget.dart';
import 'package:flutter_sign_me/global.dart';
import 'package:flutter_sign_me/pages/eform/eform_page.dart';
import 'package:flutter_sign_me/pages/news_page.dart';
import 'package:flutter_sign_me/pages/purchasing/purchasing_page.dart';
import 'package:flutter_sign_me/pages/auth/login_page.dart';
import 'package:flutter_sign_me/themes/colors.dart';
import 'package:flutter_sign_me/themes/images_path.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.person_rounded),
        title: const Text(
          'John Doe',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        centerTitle: false,
        titleSpacing: 0,
        actions: [
          InkWell(
              onTap: () {
                showDialogVersion(context);
              },
              child: const Icon(Icons.info_outline_rounded)),
          const VerSpace(width: 15),
          InkWell(
            onTap: () => replacePageWith(context, const LoginPage()),
            child: const Icon(Icons.logout_rounded),
          ),
          const VerSpace(width: 15),
        ],
        foregroundColor: smcGreen,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BoxMenu(),
            const Space(height: 30),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Text(
                'News',
                style: TextStyle(
                  color: smcBlack,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const ItemListNews();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> showDialogVersion(BuildContext context) {
    return showDialog(
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Space(height: 30),
                Image.asset(logoImg),
                const Space(height: 20),
                Text(
                  'Sign Me V 1.0.0',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: smcGrey77, fontSize: 16),
                ),
                const Space(height: 30),
              ],
            ),
          ),
        );
      },
      context: context,
    );
  }
}

class BoxMenu extends StatelessWidget {
  const BoxMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: ShapeDecoration(
        color: smcGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => replacePageWith(context, const EformPage()),
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 15, top: 10),
                    child: const Menu(label: 'eForm'),
                  ),
                  const Positioned(
                      right: 0, child: BadgeUnread(totalUnread: 100)),
                ],
              ),
            ),
            InkWell(
              onTap: () => replacePageWith(context, const PurchasingPage()),
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 15, top: 10),
                    child: const Menu(label: 'Purchasing\nRequest'),
                  ),
                  const Positioned(
                      right: 0, child: BadgeUnread(totalUnread: 100)),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 15, top: 10),
                  child: const Menu(label: 'Purchasing\nOrder'),
                ),
                const Positioned(
                    right: 0, child: BadgeUnread(totalUnread: 100)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BadgeUnread extends StatelessWidget {
  final int totalUnread;
  const BadgeUnread({super.key, required this.totalUnread});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(7, 5, 7, 5),
      decoration: BoxDecoration(
        color: smcRed,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Text(
        '99+',
        textAlign: TextAlign.center,
        style: TextStyle(color: smcWhite, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class Menu extends StatelessWidget {
  final String label;
  const Menu({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: MediaQuery.sizeOf(context).width * 0.11,
          backgroundColor: smcWhite,
          child: const Icon(Icons.document_scanner_rounded, size: 35),
        ),
        const Space(height: 5),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: smcWhite,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class ItemListNews extends StatelessWidget {
  const ItemListNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => replacePageWith(context, const NewsPage()),
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color: smcWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 76,
              height: 76,
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
            const VerSpace(width: 23),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Maintenance for Swimming Pool',
                    textAlign: TextAlign.start,
                    style: TextStyle(
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
                      fontSize: 12,
                      letterSpacing: -0.30,
                      height: 0,
                    ),
                  ),
                  const Space10(),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In aliquet malesuada ex',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: smcBlack33,
                      fontSize: 12,
                      height: 0,
                      letterSpacing: -0.30,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
