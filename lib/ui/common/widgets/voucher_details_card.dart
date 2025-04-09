import 'package:flutter/material.dart';

import '../../features/redemption/widgets/coupon_code_dialog.dart';
import '../theme/colors.dart';

class VoucherDetailsCard extends StatefulWidget {
  final String title;
  final String label;
  final String value;
  final VoidCallback? onRedeemedNowPressed;

  const VoucherDetailsCard({
    super.key,
    required this.title,
    required this.label,
    required this.value,
    this.onRedeemedNowPressed,
  });

  @override
  State<VoucherDetailsCard> createState() => _VoucherDetailsCardState();
}

class _VoucherDetailsCardState extends State<VoucherDetailsCard> {
  TextEditingController couponCodeTextFieldController = TextEditingController();

  void onRedeemNowPressed(String couponCode) {

  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 24),
    child: Stack(
      children: [
        Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: purple.withAlpha(50),
                  image: DecorationImage(
                    image: AssetImage("lib/ui/common/icons/img_confetti.png"),
                    opacity: 0.15,
                    fit: BoxFit.cover,
                  ),
                  border: Border(
                    bottom: BorderSide(
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
                    right: BorderSide(
                      color: Colors.grey,
                      width: .5,
                      style: BorderStyle.solid,
                    ),
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: ClipOval(
                          child: Container(
                            color: blue.withAlpha(40),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Image.asset(
                                "lib/ui/common/icons/img_voucher_outlined.png",
                                width: 32,
                                height: 32,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        widget.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextTheme.of(
                          context,
                        ).labelMedium?.copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Text(
                          widget.label,
                          overflow: TextOverflow.ellipsis,
                          style: TextTheme.of(context).labelSmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                margin: EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/ui/common/icons/img_confetti.png"),
                    opacity: 0.15,
                    fit: BoxFit.cover,
                  ),
                  color: purple.withAlpha(50),
                  border: Border(
                    right: BorderSide(
                      color: Colors.grey,
                      width: .5,
                      style: BorderStyle.solid,
                    ),
                    top: BorderSide(
                      color: Colors.grey,
                      width: .5,
                      style: BorderStyle.none,
                    ),
                    left: BorderSide(
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
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 8),
                        Image.asset(
                          "lib/ui/common/icons/img_confetti_cone.png",
                          width: 32,
                          height: 32,
                        ),
                        SizedBox(height: 12),
                        Text(
                          widget.value,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: TextTheme.of(context).headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder:
                                    (context) => CouponCodeDialog(
                                      couponCodeTextFieldController: couponCodeTextFieldController,
                                    ),
                              );
                            },
                            child: TextField(
                              controller: couponCodeTextFieldController,
                              enabled: false,
                              style: TextTheme.of(context).labelSmall,
                              cursorColor: blue.withAlpha(100),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: "Coupon Code",
                                hintStyle: TextTheme.of(context).labelSmall
                                    ?.copyWith(fontWeight: FontWeight.normal),
                                fillColor: Colors.transparent,
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 0.5,
                                    color: Colors.grey,
                                  ),
                                ),
                                isDense: true,
                                filled: true,
                                isCollapsed: true,
                                contentPadding: EdgeInsets.all(4),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 0.5,
                                    color: Colors.grey,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 0.5,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "If coupon is applicable, you'll get a cashback in your wallet",
                            textAlign: TextAlign.center,
                            style: TextTheme.of(context).labelSmall?.copyWith(
                              fontSize: 10,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    if (widget.onRedeemedNowPressed != null)
                      SizedBox(
                        width: double.infinity,
                        height: 32,
                        child: FilledButton(
                          onPressed: widget.onRedeemedNowPressed,
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.deepPurpleAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            "Redeem Now",
                            style: TextTheme.of(
                              context,
                            ).labelSmall?.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    SizedBox(height: 24),
                    Text(
                      widget.onRedeemedNowPressed != null
                          ? "Valid Till 26 April, 2025"
                          : "No longer valid",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextTheme.of(context).labelSmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 130,
          left: -35,
          child: Container(
            decoration: BoxDecoration(
              color: lightBlue,
              shape: BoxShape.circle,
              border: Border.all(width: 0.5, color: Colors.grey),
            ),
            width: 50,
            height: 50,
          ),
        ),
        Positioned(
          top: 130,
          right: -35,
          child: Container(
            decoration: BoxDecoration(
              color: lightBlue,
              shape: BoxShape.circle,
              border: Border.all(width: 0.5, color: Colors.grey),
            ),
            width: 50,
            height: 50,
          ),
        ),
        Positioned(
          top: 146,
          left: 24,
          right: 24,
          child: Divider(thickness: 0.5),
        ),
      ],
    ),
  );
}
