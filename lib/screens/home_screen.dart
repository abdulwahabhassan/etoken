import 'dart:io';

import 'package:etoken/assets/colors/color.dart';
import 'package:etoken/screens/camera_screen.dart';
import 'package:etoken/screens/redemption_history_screen.dart';
import 'package:etoken/screens/voucher_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../widgets/transactions_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.title = "Home"});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? image;
  final ImagePicker picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final directory = await getApplicationDocumentsDirectory();
      final imagePath = '${directory.path}/profile_image.png';
      final savedImage = await File(pickedFile.path).copy(imagePath);
      setState(() {
        image = savedImage;
      });
    }
  }

  Future<void> loadImage() async {
    final directory = await getApplicationDocumentsDirectory();
    final imagePath = '${directory.path}/profile_image.png';

    if (File(imagePath).existsSync()) {
      setState(() {
        image = File(imagePath);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController redemptionCodeTextFieldController =
        TextEditingController();

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
                    onPressed: () {},
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
                  Flexible(
                    fit: FlexFit.tight,
                    child: _QuickActionsListItem(
                      icon: Icons.receipt_long_rounded,
                      title: "Marketplace",
                      onPressed: () {},
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: _QuickActionsListItem(
                      icon: Icons.search_rounded,
                      title: "Redeem",
                      onPressed:
                          () => {
                            showDialog(
                              context: context,
                              builder:
                                  (context) => AlertDialog(
                                    actionsAlignment: MainAxisAlignment.center,
                                    title: Column(
                                      children: [
                                        Icon(Icons.search_rounded, size: 24),
                                        SizedBox(height: 16),
                                        Text(
                                          "How would you like to redeem?",
                                          style: TextTheme.of(context)
                                              .labelMedium
                                              ?.copyWith(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    actions: [
                                      SizedBox(
                                        width: double.infinity,
                                        height: 36,
                                        child: FilledButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            showDialog(
                                              context: context,
                                              builder:
                                                  (context) => AlertDialog(
                                                    actionsAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    title: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                          "lib/assets/images/img_voucher_colored.png",
                                                          width: 32,
                                                          height: 32,
                                                        ),
                                                        SizedBox(height: 16),
                                                        Text(
                                                          "Enter redemption code to redeem voucher",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextTheme.of(
                                                                context,
                                                              ).labelMedium
                                                              ?.copyWith(
                                                                color:
                                                                    Colors
                                                                        .black,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    content: TextField(
                                                      controller:
                                                          redemptionCodeTextFieldController,
                                                      style:
                                                          TextTheme.of(
                                                            context,
                                                          ).bodyMedium,
                                                      cursorColor: blue
                                                          .withAlpha(100),
                                                      decoration: InputDecoration(
                                                        hintText:
                                                            "Redemption Code",
                                                        hintStyle: TextTheme.of(
                                                          context,
                                                        ).labelSmall?.copyWith(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                        fillColor: blue
                                                            .withAlpha(16),
                                                        border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                8,
                                                              ),
                                                          borderSide:
                                                              BorderSide.none,
                                                        ),
                                                        isDense: true,
                                                        filled: true,
                                                        isCollapsed: true,
                                                        contentPadding:
                                                            EdgeInsets.symmetric(
                                                              horizontal: 12,
                                                              vertical: 8,
                                                            ),
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            8,
                                                          ),
                                                    ),
                                                    actions: [
                                                      SizedBox(
                                                        height: 36,
                                                        child: TextButton.icon(
                                                          iconAlignment:
                                                              IconAlignment.end,
                                                          onPressed: () {
                                                            Navigator.pop(
                                                              context,
                                                            );
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (
                                                                      buildContext,
                                                                    ) =>
                                                                        VoucherDetailsScreen(),
                                                              ),
                                                            );
                                                          },
                                                          icon: Icon(
                                                            Icons
                                                                .keyboard_double_arrow_right_rounded,
                                                            color: Colors.green,
                                                            size: 16,
                                                          ),
                                                          label: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                  left: 8,
                                                                ),
                                                            child: Text(
                                                              "Proceed",
                                                              style: TextTheme.of(
                                                                    context,
                                                                  ).labelSmall
                                                                  ?.copyWith(
                                                                    color:
                                                                        Colors
                                                                            .deepPurple,
                                                                  ),
                                                            ),
                                                          ),
                                                          style: TextButton.styleFrom(
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    8,
                                                                  ),
                                                              side: BorderSide(
                                                                width: 0.5,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                            );
                                          },
                                          style: FilledButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                              side: BorderSide(
                                                color: Colors.grey,
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            spacing: 8,
                                            children: [
                                              Text(
                                                "Enter Code",
                                                style: TextTheme.of(
                                                  context,
                                                ).labelSmall?.copyWith(
                                                  color: blue,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Icon(
                                                Icons.keyboard_alt_outlined,
                                                size: 16,
                                                color: blue,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      SizedBox(
                                        width: double.infinity,
                                        height: 36,
                                        child: FilledButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder:
                                                    (builder) =>
                                                        const CameraScreen(),
                                              ),
                                            );
                                          },
                                          style: FilledButton.styleFrom(
                                            backgroundColor: blue,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            spacing: 8,
                                            children: [
                                              Text(
                                                "Scan",
                                                style: TextTheme.of(
                                                  context,
                                                ).labelSmall?.copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Icon(
                                                Icons.qr_code_scanner_rounded,
                                                size: 16,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
