import 'dart:io';

import 'package:etoken/assets/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.title = "Home"});

  final String title;

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
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
    return Scaffold(
      backgroundColor: lightBlue,
      body: Container(
        margin: EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              margin: EdgeInsets.symmetric(horizontal: 16),
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
              margin: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: _QuickActionsListItem(
                      icon: Icons.receipt_long_rounded,
                      title: "Marketplace",
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: _QuickActionsListItem(
                      icon: Icons.search_rounded,
                      title: "Redeem",
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: _QuickActionsListItem(
                      icon: Icons.history,
                      title: "Redemption History",
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
            Flexible(
              // height: 80,
              child: ListView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
                children: [
                  _RecentTransactionsListItem(
                    title: "Voucher 1",
                    label: "28 Mar, 2025 20:47",
                    value: "\$250,000",
                  ),

                  _RecentTransactionsListItem(
                    title: "Voucher 1",
                    label: "28 Mar, 2025 20:47",
                    value: "\$1,050,000",
                  ),
                  _RecentTransactionsListItem(
                    title: "Voucher 1",
                    label: "28 Mar, 2025 20:47",
                    value: "\$25.90",
                  ),
                  _RecentTransactionsListItem(
                    title: "Voucher 1",
                    label: "28 Mar, 2025 20:47",
                    value: "\$25.90",
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
          Text(value),
        ],
      ),
    );
  }
}

class _QuickActionsListItem extends StatelessWidget {
  const _QuickActionsListItem({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: purple.withAlpha(50),
        border: Border.all(color: Colors.grey, width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
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

class _RecentTransactionsListItem extends StatelessWidget {
  const _RecentTransactionsListItem({
    super.key,
    required this.title,
    required this.label,
    required this.value,
  });

  final String title;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            // margin: EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: purple.withAlpha(50),
              border: Border(
                right: BorderSide(
                  color: Colors.grey,
                  width: .5,
                  style: BorderStyle.none,
                ),
                left: BorderSide(
                  color: Colors.grey,
                  width: .5,
                  style: BorderStyle.solid,
                ),
                top: BorderSide(
                  color: Colors.grey,
                  width: .5,
                  style: BorderStyle.solid,
                ),
                bottom: BorderSide(
                  color: Colors.grey,
                  width: .5,
                  style: BorderStyle.solid,
                ),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipOval(
              child: Container(
                color: blue.withAlpha(40),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Image.asset(
                    "lib/assets/images/img_voucher.png",
                    width: 16,
                    height: 16,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: List.generate(11, (index) {
              return Container(
                color: index % 2 == 0 ? Colors.grey : Colors.white,
                width: .5,
                height: 3.4,
              );
            }),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8),
              // margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: purple.withAlpha(50),
                border: Border(
                  right: BorderSide(
                    color: Colors.grey,
                    width: .5,
                    style: BorderStyle.solid,
                  ),
                  left: BorderSide(
                    color: Colors.grey,
                    width: .5,
                    style: BorderStyle.none,
                  ),
                  top: BorderSide(
                    color: Colors.grey,
                    width: .5,
                    style: BorderStyle.solid,
                  ),
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: .5,
                    style: BorderStyle.solid,
                  ),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextTheme.of(context).labelSmall,
                  ),
                  SizedBox(height: 2),
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextTheme.of(context).labelSmall,
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
