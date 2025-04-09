import 'dart:io';

import 'package:etoken/ui/features/dashboard/viewmodels/dircet_dashboard_screen_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import '../../../common/screens/voucher_details_screen.dart';
import '../../../common/widgets/app_bar.dart';
import '../../../common/widgets/transactions_list_item.dart';
import '../../../common/theme/colors.dart';
import '../../profile/screens/profile_screen.dart';
import '../../transactions/screens/transactions_screen.dart';
import '../widgets/redeem_voucher_dialog.dart';

class DirectDashboardScreen extends StatefulWidget {
  final String title;
  final DirectDashboardScreenViewModel viewModel;

  const DirectDashboardScreen({
    super.key,
    this.title = "Home",
    required this.viewModel,
  });

  @override
  State<DirectDashboardScreen> createState() => _DirectDashboardScreenState();
}

class _DirectDashboardScreenState extends State<DirectDashboardScreen> {
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
  void didChangeDependencies() {
    super.didChangeDependencies();
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
            showDialog(
              context: context,
              builder: (context) => RedeemVoucherDialog(),
            );
          },
          icon: Icon(Icons.redeem_rounded, color: Colors.white),
          iconAlignment: IconAlignment.end,
          style: TextButton.styleFrom(
            backgroundColor: Colors.deepPurpleAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: BorderSide(color: Colors.grey, width: 0.5),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16)
          ),
          label: Text(
            "Redeem",
            style: TextTheme.of(context).labelSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
        // FilledButton(
        //   onPressed: () => {
        //     showDialog(
        //       context: context,
        //       builder: (context) => RedeemVoucherDialog(),
        //     ),
        //   },
        //   style: FilledButton.styleFrom(
        //     backgroundColor: Colors.deepPurpleAccent,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(24),
        //       side: BorderSide(color: Colors.grey, width: 0.5),
        //     ),
        //   ),
        //   child: ,
        // )
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
                      ListenableBuilder(
                        listenable: widget.viewModel,
                        builder:
                            (buildContext, _) => Text(
                              widget.viewModel.user != null
                                  ? "${widget.viewModel.user!.firstname} ${widget.viewModel.user!.lastname}"
                                  : "",
                              style: TextTheme.of(context).labelMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
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
            SizedBox(height: 8),
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
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (buildContext) => TransactionsScreen(),
                          ),
                        );
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
