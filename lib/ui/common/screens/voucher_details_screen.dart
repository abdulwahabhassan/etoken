import 'package:etoken/ui/navigation/router.dart';
import 'package:etoken/ui/common/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/app_bar.dart';
import '../widgets/voucher_details_card.dart';
import '../theme/colors.dart';

class VoucherDetailsScreen extends StatelessWidget {
  const VoucherDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: lightBlue,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 48),
        child: ETokenAppBar(title: "Voucher Details"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              children: [
                // Text(
                //   "Voucher is valid for redemption",
                //   style: TextTheme.of(context).labelMedium,
                //   textAlign: TextAlign.center,
                // ),
                // SizedBox(height: 16,),
                VoucherDetailsCard(
                  title: "Uber",
                  label: "Redeemable on all rides globally",
                  value: "\$200",
                  onRedeemedNowPressed: () {
                    context.push(resultRoute);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
