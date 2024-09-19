import 'package:flutter/material.dart';
import 'package:flutter_sign_me/dry_widget/line_widget.dart';
import 'package:flutter_sign_me/dry_widget/space_widget.dart';
import 'package:flutter_sign_me/global.dart';
import 'package:flutter_sign_me/pages/eform/eform_page.dart';
import 'package:flutter_sign_me/themes/colors.dart';
import 'package:flutter_sign_me/themes/images_path.dart';

class EformDetailPage extends StatelessWidget {
  const EformDetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    return PopScopeF316(
      onPopInvoked: (didPop, result) =>
          replacePageWith(context, const EformPage()),
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
                  onTap: () => replacePageWith(context, const EformPage()),
                  child: const Icon(Icons.chevron_left_rounded),
                ),
                title: Text(
                  'Detail Item eForm',
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
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: ShapeDecoration(
                        color: smcWhite,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          EformHeaderSection(),
                          EformInfoTenantSection(),
                          LineThick5(),
                          EformInfoKeluarMasukBarangSection(),
                          LineThick5(),
                          EformInfoBarangSection(),
                          LineThick5(),
                          EformApproverSection(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: Container(
                width: getWidth(context),
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                      child: InkWell(
                        onTap: () {},
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
          ),
        ],
      ),
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
                          Text(
                            'Please Confirm',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: smcBlack33,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          const Space10(),
                          Image.asset(warningImg, height: 48, width: 48),
                          const Space10(),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Are you sure want to\n',
                                  style: TextStyle(
                                    color: smcBlack33,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Reject?',
                                  style: TextStyle(
                                    color: smcBlack33,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Space(height: 30),
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
}

// util
class EformApproverSection extends StatelessWidget {
  const EformApproverSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Approver',
            style: TextStyle(
              color: smcBlack33,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          const Space(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(personOrangeImg),
                  const VerSpace10(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chief Engineer',
                        style: TextStyle(
                          color: smcBlack33,
                          fontSize: 15,
                          height: 0,
                        ),
                      ),
                      InkWell(
                        onTap: () => modalApproverStatusInfo(context),
                        child: Text(
                          'View Note',
                          style: TextStyle(
                            color: smcPurple,
                            fontSize: 13,
                            height: 0,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'APPROVED',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: smcBlack33,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  Text(
                    '03 Nov 2021, 13:03 WIB',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: smcGrey99,
                      fontSize: 12,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Space10(),
        ],
      ),
    );
  }

  Future<dynamic> modalApproverStatusInfo(context) {
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
                child: Center(
                  child: Text(
                    'Notes',
                    style: TextStyle(
                      color: smcGreen,
                      fontSize: 16,
                      fontFamily: 'Proxima Nova',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  children: [
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pulvinar dictum pharetra lobortis ut et. Praesent tortor fermentum sed lectus quis viverra. Augue facilisis nisl malesuada sem arcu. Placerat consequat diam vehicula sodales ut. Et nec nibh netus scelerisque senectus nulla.Volutpat arcu porttitor nunc nunc eget nibh feugiat scelerisque. Interdum quam.',
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
}

class EformInfoBarangSection extends StatelessWidget {
  const EformInfoBarangSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'INFO BARANG',
            style: TextStyle(
              color: smcBlack33,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          const Space(height: 15),
          Row(
            children: [
              Icon(Icons.arrow_circle_right_outlined, color: smcPurple),
              const VerSpace10(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '5 buah ',
                          style: TextStyle(color: smcGrey55),
                        ),
                        TextSpan(
                          text: 'Bak Mandi\n',
                          style: TextStyle(color: smcBlack33),
                        ),
                        TextSpan(
                          text: 'Ket : ',
                          style: TextStyle(
                            color: smcBlack33,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: 'Lorem Ipsum dolor sit amet',
                          style: TextStyle(color: smcGrey55),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class EformInfoKeluarMasukBarangSection extends StatelessWidget {
  const EformInfoKeluarMasukBarangSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'INFO KELUAR/MASUK BARANG',
            style: TextStyle(
              color: smcBlack33,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          const Space(height: 15),
          const LabelValueColGreyBlack(),
          const Space10(),
          const LabelValueColGreyBlack(),
          const Space10(),
          const LabelValueColGreyBlack(),
        ],
      ),
    );
  }
}

class EformInfoTenantSection extends StatelessWidget {
  const EformInfoTenantSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'INFO TENANT',
            style: TextStyle(
              color: smcBlack33,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          const Space(height: 15),
          const LabelValueColGreyBlack(),
          const Space10(),
          const LabelValueColGreyBlack(),
          const Space10(),
          const LabelValueColGreyBlack(),
        ],
      ),
    );
  }
}

class LabelValueColGreyBlack extends StatelessWidget {
  const LabelValueColGreyBlack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nama Tenant',
          style: TextStyle(color: smcGrey99, fontSize: 13, height: 0),
        ),
        Text(
          'Bimasakti Coffee Shop',
          style: TextStyle(color: smcBlack33, fontSize: 15, height: 0),
        ),
      ],
    );
  }
}

class EformHeaderSection extends StatelessWidget {
  const EformHeaderSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          decoration: ShapeDecoration(
            color: smcGreen19,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(icFileEformImg, width: 20, height: 20),
                  const VerSpace(width: 15),
                  Text(
                    'Ijin Keluar/Masuk Barang Fit Out',
                    style: TextStyle(
                      color: smcBlueA9,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ],
              ),
              const Space10(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tanggal Ijin',
                    style: TextStyle(
                      color: smcGrey99,
                      fontSize: 12,
                      height: 0,
                    ),
                  ),
                  Text(
                    '03 Nov 2021, 13:03 WIB',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: smcGrey99,
                      fontSize: 12,
                      height: 0,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
