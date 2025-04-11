import 'dart:io';

import 'package:etoken/ui/navigation/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';

import '../../../common/screens/voucher_details_screen.dart';
import '../../../common/widgets/app_bar.dart';
import '../../../common/widgets/transactions_list_item.dart';
import '../../../common/theme/colors.dart';
import '../../profile/screens/profile_screen.dart';
import '../../transactions/screens/transactions_screen.dart';

class TallyDashboardScreen extends StatefulWidget {
  final String title;

  const TallyDashboardScreen({super.key, this.title = "Home"});

  @override
  State<TallyDashboardScreen> createState() => _TallyDashboardScreenState();
}

class _TallyDashboardScreenState extends State<TallyDashboardScreen> {
  File? image;

  Future<void> loadImage() async {
    final directory = await getApplicationDocumentsDirectory();
    final imagePath = '${directory.path}/$profileImageTitle';

    if (File(imagePath).existsSync()) {
      setState(() {
        image = File(imagePath);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: lightBlue,
      ),
    );
    loadImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlue,
      floatingActionButton: SizedBox(
        height: 40,
        child: TextButton.icon(
          onPressed: () {
            // showDialog(
            //   context: context,
            //   builder: (context) => RedeemVoucherDialog(),
            // );
          },
          icon: Icon(Icons.receipt_long, color: Colors.white),
          iconAlignment: IconAlignment.end,
          style: TextButton.styleFrom(
            backgroundColor: Colors.deepPurpleAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: BorderSide(color: Colors.grey, width: 0.5),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
          label: Text(
            "Issue voucher",
            style: TextTheme.of(context).labelSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 48),
        child: ETokenAppBar(title: "Dashboard", showBackButton: false),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              margin: EdgeInsets.only(left: 16, right: 16),
              // color: blue,
              decoration: BoxDecoration(
                // color: blue,
                border: Border.all(color: Colors.grey, width: 0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Hassan Abdulwahab",
                        style: TextTheme.of(
                          context,
                        ).labelMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Tipper Garage RP",
                        style: TextTheme.of(context).labelSmall,
                      ),
                    ],
                  ),
                  IconButton(
                    style: IconButton.styleFrom(
                      side: BorderSide(
                        color: Colors.deepPurpleAccent,
                        width: 2,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      context.push(profileRoute);
                    },
                    iconSize: 50,
                    icon: ClipOval(
                      child:
                          image != null
                              ? Image.file(
                                image!,
                                width: 32,
                                height: 32,
                                fit: BoxFit.cover,
                              )
                              : Image.asset(
                                "lib/ui/common/icons/img_happy_face.png",
                                width: 32,
                                height: 32,
                                fit: BoxFit.cover,
                              ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 4),
            Container(
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(8),
              //   color: blue.withAlpha(40),
              // ),
              // padding: EdgeInsets.all(4),
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 4,
                children: [
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 0.5, color: Colors.grey),
                        // color: Colors.deepPurpleAccent.withAlpha(50),
                      ),
                      child: Column(
                        spacing: 8,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Text(
                              "Downloaded",
                              style: TextTheme.of(context).labelSmall?.copyWith(
                                color: grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8),
                              // border: Border.all(width: 0.5, color: Colors.grey),
                              color: Colors.green.withAlpha(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              spacing: 8,
                              children: [
                                Column(
                                  spacing: 4,
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Count",
                                      style: TextTheme.of(context).labelSmall
                                          ?.copyWith(color: Colors.black),
                                    ),
                                    Text(
                                      "100",
                                      style: TextTheme.of(
                                        context,
                                      ).labelLarge?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  spacing: 4,
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Value",
                                      style: TextTheme.of(context).labelSmall
                                          ?.copyWith(color: Colors.black),
                                    ),
                                    Text(
                                      "\$25,000",
                                      style: TextTheme.of(
                                        context,
                                      ).labelLarge?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 0.5, color: Colors.grey),
                        // color: Colors.pinkAccent.withAlpha(50),
                      ),
                      child: Column(
                        spacing: 8,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Text(
                              "Txn Summary",
                              style: TextTheme.of(context).labelSmall?.copyWith(
                                color: grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8),
                              // border: Border.all(width: 0.5, color: Colors.grey),
                              color: Colors.blueAccent.withAlpha(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              spacing: 8,
                              children: [
                                Column(
                                  spacing: 4,
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Count",
                                      style: TextTheme.of(context).labelSmall
                                          ?.copyWith(color: Colors.black),
                                    ),
                                    Text(
                                      "100",
                                      style: TextTheme.of(
                                        context,
                                      ).labelLarge?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  spacing: 4,
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Value",
                                      style: TextTheme.of(context).labelSmall
                                          ?.copyWith(color: Colors.black),
                                    ),
                                    Text(
                                      "\$25,000",
                                      style: TextTheme.of(
                                        context,
                                      ).labelLarge?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Recent Transactions",
                    style: TextTheme.of(
                      context,
                    ).labelMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 32,
                    child: TextButton(
                      onPressed: () {
                        context.push(transactionsRoute);
                      },
                      child: Text(
                        "View more",
                        style: TextTheme.of(
                          context,
                        ).labelSmall?.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 74),
              child: Column(
                // scrollDirection: Axis.vertical,
                // padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
                children: [
                  TransactionsListItem(
                    title: "Voucher 1",
                    label: "28 Mar, 2025 20:47",
                    value: "\$250,000",
                    onPressed: () => context.push(voucherDetailsRoute),
                  ),

                  TransactionsListItem(
                    title: "Voucher 2",
                    label: "28 Mar, 2025 20:47",
                    value: "\$1,050,000",
                    onPressed: () => context.push(voucherDetailsRoute),
                  ),
                  TransactionsListItem(
                    title: "Voucher 3",
                    label: "28 Mar, 2025 20:47",
                    value: "\$25.90",
                    onPressed: () => context.push(voucherDetailsRoute),
                  ),
                  TransactionsListItem(
                    title: "Voucher 4",
                    label: "28 Mar, 2025 20:47",
                    value: "\$25.90",
                    onPressed: () => context.push(voucherDetailsRoute),
                  ),
                  TransactionsListItem(
                    title: "Voucher 4",
                    label: "28 Mar, 2025 20:47",
                    value: "\$25.90",
                    onPressed: () => context.push(voucherDetailsRoute),
                  ),
                  TransactionsListItem(
                    title: "Voucher 4",
                    label: "28 Mar, 2025 20:47",
                    value: "\$25.90",
                    onPressed: () => context.push(voucherDetailsRoute),
                  ),
                  TransactionsListItem(
                    title: "Voucher 4",
                    label: "28 Mar, 2025 20:47",
                    value: "\$25.90",
                    onPressed: () => context.push(voucherDetailsRoute),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
