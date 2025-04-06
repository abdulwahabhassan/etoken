import 'dart:io';

import 'package:etoken/assets/colors/color.dart';
import 'package:etoken/dialogs/issue_dialog.dart';
import 'package:etoken/dialogs/voucher_code_dialog.dart';
import 'package:etoken/screens/camera_screen.dart';
import 'package:etoken/screens/navigator_observer.dart';
import 'package:etoken/screens/profile_screen.dart';
import 'package:etoken/screens/redemption_history_screen.dart';
import 'package:etoken/screens/voucher_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../dialogs/redeem_dialog.dart';
import '../widgets/transactions_list_item.dart';

class DirectHomeScreen extends StatefulWidget {
  final String title;

  // final AppNavigatorObserver appNavigatorObserver;

  const DirectHomeScreen({super.key, this.title = "Home"});

  @override
  State<DirectHomeScreen> createState() => _DirectHomeScreenState();
}

class _DirectHomeScreenState extends State<DirectHomeScreen> {
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
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 55),
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 40, bottom: 12),
          child: Text(
            "Dashboard",
            style: TextStyle(
              fontSize: 18,
              fontFamily: "Rowdies",
              color: Colors.black87,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              margin: EdgeInsets.only(left: 16, right: 16, top: 4),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (buildContext) => ProfileScreen(),
                        ),
                      );
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
                                "lib/assets/images/img_happy_face.png",
                                width: 32,
                                height: 32,
                                fit: BoxFit.cover,
                              ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Daily Stats",
                style: TextTheme.of(
                  context,
                ).labelMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                // itemExtent: 150,
                padding: EdgeInsets.symmetric(horizontal: 12),
                children: [
                  _DailyStatsListItem(
                    icon: Icons.attach_money_rounded,
                    title: "Balance",
                    value: "\$250,000",
                  ),
                  _DailyStatsListItem(
                    icon: Icons.redeem,
                    title: "Redemptions",
                    value: "10",
                  ),
                  _DailyStatsListItem(
                    icon: Icons.check_circle,
                    title: "Total Value Redeemed",
                    value: "200",
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Quick Actions",
                style: TextTheme.of(
                  context,
                ).labelMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 60,
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                spacing: 4,
                children: [
                  // Flexible(
                  //   fit: FlexFit.tight,
                  //   child: _QuickActionsListItem(
                  //     icon: Icons.receipt_long_rounded,
                  //     title: "Issue",
                  //     onPressed: () {
                  //       showDialog(
                  //         context: context,
                  //         builder: (buildContext) => IssueDialog(),
                  //       );
                  //     },
                  //   ),
                  // ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: _QuickActionsListItem(
                      icon: Icons.redeem_rounded,
                      title: "Redeem",
                      onPressed:
                          () => {
                            showDialog(
                              context: context,
                              builder: (context) => RedeemDialog(),
                            ),
                          },
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: _QuickActionsListItem(
                      icon: Icons.history,
                      title: "History",
                      onPressed:
                          () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder:
                                  (buildContext) => RedemptionHistoryScreen(),
                            ),
                          ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Recent Transactions",
                style: TextTheme.of(
                  context,
                ).labelMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
              child: Column(
                // scrollDirection: Axis.vertical,
                // padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
                children: [
                  TransactionsListItem(
                    title: "Voucher 1",
                    label: "28 Mar, 2025 20:47",
                    value: "\$250,000",
                    onPressed:
                        () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (buildContext) => VoucherDetailsScreen(),
                          ),
                        ),
                  ),

                  TransactionsListItem(
                    title: "Voucher 2",
                    label: "28 Mar, 2025 20:47",
                    value: "\$1,050,000",
                    onPressed:
                        () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (buildContext) => VoucherDetailsScreen(),
                          ),
                        ),
                  ),
                  TransactionsListItem(
                    title: "Voucher 3",
                    label: "28 Mar, 2025 20:47",
                    value: "\$25.90",
                    onPressed:
                        () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (buildContext) => VoucherDetailsScreen(),
                          ),
                        ),
                  ),
                  TransactionsListItem(
                    title: "Voucher 4",
                    label: "28 Mar, 2025 20:47",
                    value: "\$25.90",
                    onPressed:
                        () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (buildContext) => VoucherDetailsScreen(),
                          ),
                        ),
                  ),
                  TransactionsListItem(
                    title: "Voucher 4",
                    label: "28 Mar, 2025 20:47",
                    value: "\$25.90",
                    onPressed:
                        () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (buildContext) => VoucherDetailsScreen(),
                      ),
                    ),
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

class _DailyStatsListItem extends StatelessWidget {
  const _DailyStatsListItem({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: pink.withAlpha(25),
        border: Border.all(color: Colors.grey, width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 16),
          SizedBox(height: 2),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextTheme.of(context).labelSmall,
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextTheme.of(
              context,
            ).bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class _QuickActionsListItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const _QuickActionsListItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          side: BorderSide(color: Colors.grey, width: 0.5),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      onPressed: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 16),
          SizedBox(height: 2),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextTheme.of(context).labelSmall,
          ),
        ],
      ),
    );
  }
}
