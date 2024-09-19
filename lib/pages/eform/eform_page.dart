import 'package:flutter/material.dart';
import 'package:flutter_sign_me/dry_widget/space_widget.dart';
import 'package:flutter_sign_me/global.dart';
import 'package:flutter_sign_me/pages/dashboard_page.dart';
import 'package:flutter_sign_me/pages/eform/eform_detail_page.dart';
import 'package:flutter_sign_me/pages/eform/eform_util.dart';
import 'package:flutter_sign_me/themes/colors.dart';
import 'package:flutter_sign_me/themes/images_path.dart';

class EformPage extends StatefulWidget {
  const EformPage({super.key});

  @override
  State<EformPage> createState() => _EformPageState();
}

class _EformPageState extends State<EformPage> with TickerProviderStateMixin {
  late final tabController = TabController(length: 2, vsync: this);
  @override
  Widget build(BuildContext context) {
    return PopScopeF316(
      onPopInvoked: (didPop, result) {
        replacePageWith(context, const DashboardPage());
      },
      child: Stack(
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
          SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                leading: InkWell(
                  onTap: () => replacePageWith(context, const DashboardPage()),
                  child: const Icon(Icons.chevron_left_rounded),
                ),
                title: Text(
                  '7 Item(s) eForm',
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
              body: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(3),
                    decoration: ShapeDecoration(
                      color: smcWhite,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                    ),
                    child: DefaultTabController(
                      length: 2,
                      child: TabBar(
                        tabs: const [Tab(text: 'New'), Tab(text: 'History')],
                        controller: tabController,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: smcGreen33,
                        ),
                        labelColor: smcGreen,
                        labelStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                        unselectedLabelColor: smcGreen,
                        unselectedLabelStyle: TextStyle(
                          color: smcGreen,
                          fontSize: 15,
                          height: 0,
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        dividerHeight: 0,
                      ),
                    ),
                  ),
                  const Space(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              isDense: true,
                              fillColor: smcGreyEf,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(color: smcGreyEf),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(color: smcGreyEf),
                              ),
                              prefixIcon: const Icon(Icons.search_rounded),
                              prefixIconColor: smcGrey75,
                              hintText: 'Search...',
                            ),
                          ),
                        ),
                        const VerSpace(width: 15),
                        CircleAvatar(
                          backgroundColor: smcGreenA4,
                          foregroundColor: smcWhite,
                          radius: 25,
                          child: const Icon(Icons.tune_rounded, size: 30),
                        )
                      ],
                    ),
                  ),
                  const Space(height: 10),
                  Expanded(
                    child: DefaultTabController(
                      length: 2,
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return const EformListItem();
                            },
                          ),
                          const SmListEmpty(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EformListItem extends StatelessWidget {
  const EformListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => replacePageWith(context, const EformDetailPage()),
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        decoration: ShapeDecoration(
          gradient: linearGradientEformListItem,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset(icIjinKerjaImg),
            ),
            Expanded(
              child: Container(
                decoration: ShapeDecoration(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(20),
                    ),
                  ),
                  color: smcWhite,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 20, 10, 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ijin Kerja',
                              style: TextStyle(
                                color: smcGrey77,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                height: 0,
                                letterSpacing: -0.30,
                              ),
                            ),
                            const Space(height: 5),
                            Text(
                              'Bimasakti Coffee',
                              style: TextStyle(
                                color: smcBlueA9,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                height: 0,
                                letterSpacing: -0.30,
                              ),
                            ),
                            const Space(height: 5),
                            Text(
                              'Mr. John Doe - 081234567890',
                              style: TextStyle(
                                color: smcGrey77,
                                fontSize: 13,
                                height: 0,
                                letterSpacing: -0.30,
                              ),
                            ),
                            const GetStatusEform(status: '1'),
                            const GetStatusEform(status: '2'),
                            const GetStatusEform(status: '3'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 20, 10, 20),
                      child: Column(
                        children: [
                          Text(
                            '03/11/2021',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: smcGrey99,
                              fontSize: 13,
                              height: 0,
                              letterSpacing: -0.30,
                            ),
                          ),
                          const Space(height: 5),
                          const Icon(Icons.chevron_right_rounded),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
