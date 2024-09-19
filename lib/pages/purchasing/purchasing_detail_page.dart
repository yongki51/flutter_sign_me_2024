import 'package:flutter/material.dart';
import 'package:flutter_sign_me/dry_widget/line_widget.dart';
import 'package:flutter_sign_me/dry_widget/purchasing_status.dart';
import 'package:flutter_sign_me/dry_widget/space_widget.dart';
import 'package:flutter_sign_me/global.dart';
import 'package:flutter_sign_me/pages/purchasing/purchasing_page.dart';
import 'package:flutter_sign_me/themes/colors.dart';
import 'package:flutter_sign_me/themes/images_path.dart';

class PurchasingDetailPage extends StatelessWidget {
  const PurchasingDetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    return PopScopeF316(
      onPopInvoked: (didPop, result) =>
          replacePageWith(context, const PurchasingPage()),
      child: Stack(
        children: [
          SizedBox.fromSize(size: Size.fromWidth(getHeight(context))),
          Scaffold(
            backgroundColor: smcGreyE7,
            appBar: AppBar(
              leading: InkWell(
                onTap: () => replacePageWith(context, const PurchasingPage()),
                child: const Icon(Icons.chevron_left_rounded),
              ),
              title: Text(
                'Detail Item Purchasing',
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
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 100),
                    decoration: ShapeDecoration(
                      color: smcWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PurchasingHeaderSection(),
                        LineThick5(),
                        PurchasingApproverSection(),
                        LineThick5(),
                        PurchasingProductSection(),
                        LineThick5(),
                        PurchasingSummarySection()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            child: Container(
              width: getWidth(context),
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () => showModalBottomReject(context),
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(smcWhite),
                          foregroundColor: WidgetStatePropertyAll(smcGreen),
                          side: WidgetStatePropertyAll(
                            BorderSide(color: smcGreen),
                          ),
                        ),
                        child: const Text(
                          "REJECT",
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
                      child: InkWell(
                        onTap: () => showModalBottomApprove(context),
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
                              'APPROVE',
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showModalBottomApprove(BuildContext context) {
    return showModalBottomSheet(
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              width: getWidth(context),
              decoration: BoxDecoration(
                color: smcWhite,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(45),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 58,
                    height: 5,
                    margin: const EdgeInsets.only(top: 20),
                    decoration: ShapeDecoration(
                      color: smcGreyC4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          20, 20, 20, MediaQuery.of(context).viewInsets.bottom),
                      child: Column(
                        children: [
                          Image.asset(warningImg, height: 48, width: 48),
                          const Space10(),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Are you sure want to ',
                                  style: TextStyle(
                                    color: smcBlack,
                                    fontSize: 16,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: 'APPROVE',
                                  style: TextStyle(
                                    color: smcGreen34,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: '\nthis transaction?',
                                  style: TextStyle(
                                    color: smcBlack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const Space10(),
                          TextFormField(
                            minLines: 3,
                            maxLines: 3,
                            decoration: InputDecoration(
                              fillColor: smcGreyFa,
                              hintText: 'Input notes (optional)...',
                              hintStyle: TextStyle(
                                color: smcGrey99,
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w900,
                                height: 0,
                                letterSpacing: -0.30,
                              ),
                            ),
                          ),
                          const Space(height: 20),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'By clicking “',
                                  style: TextStyle(
                                    color: smcGrey77,
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Yes',
                                  style: TextStyle(
                                    color: smcGrey77,
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      '” you are not be able to undo this action',
                                  style: TextStyle(color: smcGrey77, height: 0),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Space(height: 50),
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
                              onPressed: () => Navigator.pop(context),
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
                                "CANCEL",
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
                                  'YES',
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
      isScrollControlled: true,
    );
  }

  Future<dynamic> showModalBottomReject(BuildContext context) {
    return showModalBottomSheet(
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              width: getWidth(context),
              decoration: BoxDecoration(
                color: smcWhite,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(45),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 58,
                    height: 5,
                    margin: const EdgeInsets.only(top: 20),
                    decoration: ShapeDecoration(
                      color: smcGreyC4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          20, 20, 20, MediaQuery.of(context).viewInsets.bottom),
                      child: Column(
                        children: [
                          Image.asset(warningImg, height: 48, width: 48),
                          const Space10(),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Are you sure want to ',
                                  style: TextStyle(
                                    color: smcBlack,
                                    fontSize: 16,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: 'REJECT',
                                  style: TextStyle(
                                    color: smcRed26,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: '\nthis transaction?',
                                  style: TextStyle(
                                    color: smcBlack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const Space10(),
                          const DropdownReason(),
                          const Space10(),
                          TextFormField(
                            minLines: 3,
                            maxLines: 3,
                            decoration: InputDecoration(
                              fillColor: smcGreyFa,
                              hintText: 'Input notes (optional)...',
                              hintStyle: TextStyle(
                                color: smcGrey99,
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w900,
                                height: 0,
                                letterSpacing: -0.30,
                              ),
                            ),
                          ),
                          const Space(height: 20),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'By clicking “',
                                  style: TextStyle(
                                    color: smcGrey77,
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Yes',
                                  style: TextStyle(
                                    color: smcGrey77,
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      '” you are not be able to undo this action',
                                  style: TextStyle(color: smcGrey77, height: 0),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Space(height: 50),
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
                                selectedReason = null;
                                Navigator.pop(context);
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
                                "CANCEL",
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
                                  'YES',
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
      isScrollControlled: true,
      isDismissible: false,
    );
  }
}

String? selectedReason;

class DropdownReason extends StatefulWidget {
  const DropdownReason({super.key});

  @override
  State<DropdownReason> createState() => _DropdownReasonState();
}

class _DropdownReasonState extends State<DropdownReason> {
  @override
  Widget build(BuildContext context) {
    List reasonList = [
      {
        "ReasonCode": "1",
        "ReasonDescription": "des 1",
      },
      {
        "ReasonCode": "2",
        "ReasonDescription": "des 2",
      }
    ];
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: smcGreyFa,
      ),
      child: DropdownButton(
        value: selectedReason,
        items: reasonList.map(
          (item) {
            return DropdownMenuItem(
              value: item['ReasonCode'],
              child: Text('${item['ReasonDescription']}'),
            );
          },
        ).toList(),
        onChanged: (dynamic newValue) {
          setState(() {
            selectedReason = newValue;
          });
        },
        underline: Container(),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        borderRadius: BorderRadius.circular(20),
        isExpanded: true,
        hint: Text(
          'Please select the reason',
          style: TextStyle(
            color: smcBlack33,
            fontSize: 15,
            height: 0,
            letterSpacing: -0.30,
          ),
        ),
        dropdownColor: smcGreyFa,
        iconEnabledColor: smcBlack33,
      ),
    );
  }
}

class PurchasingSummarySection extends StatelessWidget {
  const PurchasingSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Purchase Summary',
            style: TextStyle(
              color: smcBlueA9,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          const Space10(),
          const LabelValueRow(
            label: 'Subtotal',
            value: '5.450.000',
            valueWeight: FontWeight.w400,
          ),
          const LineThick2(),
          const LabelValueRow(
            label: 'Subtotal',
            value: '5.450.000',
            valueWeight: FontWeight.w400,
          ),
          const LineThick2(),
          const LabelValueRow(
            label: 'Subtotal',
            value: '5.450.000',
          ),
          const LabelValueRow(
            label: 'Add-On',
            value: '5.450.000',
            valueWeight: FontWeight.w400,
          ),
          const LineThick2(),
          const LabelValueRow(
            label: 'Total Before PPN',
            value: '5.450.000',
          ),
          const LineThick2(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Include PPN',
                style: TextStyle(
                  color: smcBlueA9,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              Text(
                'Rp6.025.097',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: smcRed49,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class PurchasingProductSection extends StatelessWidget {
  const PurchasingProductSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Container(
        color: smcBlackOpa01,
        padding: const EdgeInsets.only(left: 5),
        child: Container(
          color: smcWhite,
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Product / Expenditure Detail',
                style: TextStyle(
                  color: smcBlueA9,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              const Space10(),
              Text(
                'Meja Makan',
                style: TextStyle(
                  color: smcBlueA9,
                  fontSize: 15,
                  height: 0,
                ),
              ),
              Text(
                '10 Unit x Rp80.000 = Rp800.000',
                style: TextStyle(
                  color: smcBlueA9,
                  fontSize: 15,
                  height: 0,
                ),
              ),
              Text(
                'Meja yang berbentuk kotak, diperlukan untuk tamu. Kalaupun berbentuk bulat juga tidak apa apa.',
                style: TextStyle(
                  color: smcBlackOpa05,
                  fontSize: 12,
                  height: 0,
                ),
              ),
              const LineThick2(),
              const LabelValueColGreyBlue(
                label: 'Requirement Date',
                value: '20 Oct 2023',
              ),
              const Space10(),
              const LabelValueColGreyBlue(
                label: 'Requirement Date',
                value: '20 Oct 2023',
              ),
              const LineThick2(),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Total Price',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: smcGrey77,
                        fontSize: 13,
                        height: 0,
                      ),
                    ),
                    Text(
                      'Rp750.000',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: smcOrange,
                        fontSize: 15,
                        fontFamily: 'Roboto',
                        height: 0,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PurchasingApproverSection extends StatelessWidget {
  const PurchasingApproverSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Approver',
            style: TextStyle(
              color: smcBlueA9,
              fontSize: 15,
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          const Space10(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(personOrangeImg),
                  const VerSpace10(),
                  Text(
                    'John Doe',
                    style: TextStyle(
                      color: smcBlack33,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () => modalApproverStatusInfo(context, []),
                child: Text(
                  'READY',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: smcBlueA9,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Future<dynamic> modalApproverStatusInfo(context, fullItem) {
  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: smcWhite,
          borderRadius: const BorderRadius.only(
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
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(approveInfoImg),
                  const VerSpace10(),
                  Text(
                    'Approver Info',
                    style: TextStyle(
                      color: smcGreen,
                      fontSize: 16,
                      fontFamily: 'Proxima Nova',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const LineThick2(),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                children: [
                  Text(
                    'notes',
                    style: TextStyle(
                      color: smcGrey55,
                      fontFamily: 'Proxima Nova',
                      fontWeight: FontWeight.w400,
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
}

class PurchasingHeaderSection extends StatelessWidget {
  const PurchasingHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LabelValueRow(
                label: 'Created Date',
                value: 'Tue, 19 Oct 2023',
              ),
              const Space10(),
              const LabelValueRow(
                label: 'Created Date',
                value: 'Tue, 19 Oct 2023',
              ),
              const Space10(),
              const LabelValueRow(
                label: 'Created Date',
                value: 'Tue, 19 Oct 2023',
              ),
              const Space10(),
              const LabelValueRow(
                label: 'Created Date',
                value: 'Tue, 19 Oct 2023',
              ),
              const LineThick2(),
              Text(
                'Description',
                style: TextStyle(
                  color: smcBlueA9,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              const Space10(),
              Text(
                'Untuk keperluan di Lobby Utama',
                style: TextStyle(
                  color: smcBlackOpa05,
                  fontSize: 12,
                  height: 0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class LabelValueColGreyBlue extends StatelessWidget {
  final String label, value;

  const LabelValueColGreyBlue({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: smcGrey77, fontSize: 13, height: 0),
        ),
        Text(
          value,
          style: TextStyle(color: smcBlueA9, fontSize: 15, height: 0),
        )
      ],
    );
  }
}

class LabelValueRow extends StatelessWidget {
  final String label, value;
  final FontWeight? valueWeight;

  const LabelValueRow({
    super.key,
    required this.label,
    required this.value,
    this.valueWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: smcBlackOpa05,
            fontSize: 13,
            height: 0,
          ),
        ),
        Text(
          value,
          textAlign: TextAlign.right,
          style: TextStyle(
            color: smcBlueA9,
            fontSize: 13,
            fontWeight: valueWeight,
            height: 0,
          ),
        ),
      ],
    );
  }
}
