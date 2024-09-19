import 'package:flutter/material.dart';
import 'package:flutter_sign_me/dry_widget/line_widget.dart';
import 'package:flutter_sign_me/dry_widget/purchasing_status.dart';
import 'package:flutter_sign_me/dry_widget/space_widget.dart';
import 'package:flutter_sign_me/global.dart';
import 'package:flutter_sign_me/pages/dashboard_page.dart';
import 'package:flutter_sign_me/pages/purchasing/purchasing_detail_page.dart';
import 'package:flutter_sign_me/themes/colors.dart';
import 'package:flutter_sign_me/themes/images_path.dart';

class PurchasingPage extends StatefulWidget {
  const PurchasingPage({super.key});

  @override
  State<PurchasingPage> createState() => PurchasingPageState();
}

class PurchasingPageState extends State<PurchasingPage>
    with TickerProviderStateMixin {
  late final tabController = TabController(length: 2, vsync: this);
  @override
  Widget build(BuildContext context) {
    return PopScopeF316(
      onPopInvoked: (didPop, result) =>
          replacePageWith(context, const DashboardPage()),
      child: Scaffold(
        backgroundColor: smcGreyE7,
        appBar: appBarPurchasing(context),
        body: SafeArea(
          child: DefaultTabController(
            length: 2,
            child: TabBarView(
              controller: tabController,
              children: const [
                ListPurchasingNew(),
                // SmListEmpty(),
                SmListEmpty(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBarPurchasing(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () => replacePageWith(context, const DashboardPage()),
        child: const Icon(Icons.chevron_left_rounded),
      ),
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
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: Column(
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
            const Space(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
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
                  InkWell(
                    onTap: () {
                      showModalBottomSheetFilterPurchasing(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: smcGreenA4,
                      foregroundColor: smcWhite,
                      radius: 30,
                      child: const Icon(Icons.tune_rounded, size: 30),
                    ),
                  )
                ],
              ),
            ),
            const Space(height: 20),
          ],
        ),
      ),
    );
  }

  int indexSortByDate = 0;
  Future<dynamic> showModalBottomSheetFilterPurchasing(BuildContext context) {
    return showModalBottomSheet(
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: const EdgeInsets.only(top: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 58,
                      height: 5,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFC4C4C4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              'Filter',
                              style: TextStyle(
                                color: smcBlack,
                                fontSize: 22,
                                fontFamily: 'Proxima Nova',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const LineThick2(),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Space(height: 15),
                                  Text(
                                    'Sort by Date',
                                    style: TextStyle(
                                      color: smcGreen,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                    ),
                                  ),
                                  const LineThick2(),
                                  const Space(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              indexSortByDate = 0;
                                            });
                                          },
                                          child: FilterSortByDateItem(
                                            icon: icOldestImg,
                                            label: 'Oldest',
                                            borderColor: (indexSortByDate == 0)
                                                ? smcGreen
                                                : smcGreyCc,
                                            bgColor: (indexSortByDate == 0)
                                                ? smcBlueF6
                                                : smcWhite,
                                          ),
                                        ),
                                      ),
                                      const VerSpace(width: 15),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              indexSortByDate = 1;
                                            });
                                          },
                                          child: FilterSortByDateItem(
                                            icon: icNewestImg,
                                            label: 'Newest',
                                            borderColor: (indexSortByDate == 0)
                                                ? smcGreyCc
                                                : smcGreen,
                                            bgColor: (indexSortByDate == 0)
                                                ? smcWhite
                                                : smcBlueF6,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Space(height: 20),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: smcGreyE7,
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  indexSortByDate = 0;
                                  Navigator.pop(context);
                                });
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(smcWhite),
                                foregroundColor:
                                    WidgetStatePropertyAll(smcGreen),
                                side: WidgetStatePropertyAll(
                                  BorderSide(color: smcGreen),
                                ),
                              ),
                              child: const Text(
                                "Reset",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const VerSpace(width: 20),
                        Expanded(
                          child: Material(
                            color: Colors.transparent,
                            child: Container(
                              height: 50,
                              decoration: ShapeDecoration(
                                gradient: linearGradient,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Submit',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: smcWhite,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
      context: context,
      backgroundColor: Colors.transparent,
      useSafeArea: true,
    );
  }
}

class FilterSortByDateItem extends StatelessWidget {
  final String icon;
  final String label;
  final Color borderColor;
  final Color bgColor;

  const FilterSortByDateItem({
    super.key,
    required this.label,
    required this.icon,
    required this.bgColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      height: 50,
      decoration: ShapeDecoration(
        color: bgColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: borderColor),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Image(image: AssetImage(icon)),
          const VerSpace10(),
          Text(
            label,
            style: TextStyle(color: smcGreen, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class ListPurchasingNew extends StatelessWidget {
  const ListPurchasingNew({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Column(
          children: [
            index == 0 ? const Space(height: 20) : const SizedBox(),
            InkWell(
              onTap: () =>
                  replacePageWith(context, const PurchasingDetailPage()),
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                decoration: ShapeDecoration(
                  color: smcWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                      decoration: ShapeDecoration(
                        color: smcGreen19,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(poLogoImg, height: 30, width: 30),
                              const VerSpace(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'PO/APPR/0001/ACC-B',
                                    style: TextStyle(
                                      color: smcGreen,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                  Text(
                                    'Tue, 19 Oct 2023',
                                    style: TextStyle(
                                      color: smcBlackOpa05,
                                      fontSize: 12,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const PurchasingStatus(),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                      child: Column(
                        children: [
                          LabelValueListItem(
                            label: 'From Department',
                            value: 'Business Department (ACC-B)',
                          ),
                          Space10(),
                          LabelValueListItem(
                            label: 'From Department',
                            value: 'Business Department (ACC-B)',
                          ),
                          Space10(),
                          LabelValueListItem(
                            label: 'From Department',
                            value: 'Business Department (ACC-B)',
                          ),
                          Space10(),
                          LabelValueListItem(
                            label: 'From Department',
                            value: 'Business Department (ACC-B)',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
