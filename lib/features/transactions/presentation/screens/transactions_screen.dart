import 'package:etoken/core/ui/theme/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/ui/shared_widgets/transactions_list_item.dart';

enum TransactionStatusFilter {
  pending,
  redeemed,
  expired,
  voucher,
  coupon,
}

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() =>
      _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
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
              alignment: Alignment.topLeft,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Redemption History",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Rowdies",
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.only(top: 16, right: 12),
              child: SizedBox(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 16,
                  children: [
                    Flexible(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(left: 12),
                        children: List.generate(
                          TransactionStatusFilter.values.length,
                          (index) => Padding(
                            padding: EdgeInsets.only(left: 4),
                            child: _FiltersListItem(
                              label:
                                  TransactionStatusFilter
                                      .values[index]
                                      .name,
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      alignment: Alignment.center,
                      style: IconButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: BorderSide(
                            width: 0.5,
                            color: Colors.grey,
                          ), // Adjust corner radius
                        ),
                      ),
                      onPressed: () {},
                      icon: Icon(Icons.tune),
                      iconSize: 16,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Container(
                // color: blue.withAlpha(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.green.withAlpha(25),
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
                child: TextField(
                  onSubmitted: (text) {},
                  style: TextTheme.of(context).bodyMedium,
                  cursorColor: Colors.green.withAlpha(100),
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextTheme.of(
                      context,
                    ).labelSmall?.copyWith(fontWeight: FontWeight.normal),
                    fillColor: Colors.transparent,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                    isDense: true,
                    filled: true,
                    isCollapsed: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(top: 16),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
                  children: [
                    TransactionsListItem(
                      title: "Voucher 1",
                      label: "28 Mar, 2025 20:47",
                      value: "\$250,000",
                    ),

                    TransactionsListItem(
                      title: "Voucher 2",
                      label: "28 Mar, 2025 20:47",
                      value: "\$1,050,000",
                    ),
                    TransactionsListItem(
                      title: "Voucher 3",
                      label: "28 Mar, 2025 20:47",
                      value: "\$25.90",
                    ),
                    TransactionsListItem(
                      title: "Voucher 4",
                      label: "28 Mar, 2025 20:47",
                      value: "\$25.90",
                    ),
                    TransactionsListItem(
                      title: "Voucher 1",
                      label: "28 Mar, 2025 20:47",
                      value: "\$250,000",
                    ),

                    TransactionsListItem(
                      title: "Voucher 2",
                      label: "28 Mar, 2025 20:47",
                      value: "\$1,050,000",
                    ),
                    TransactionsListItem(
                      title: "Voucher 3",
                      label: "28 Mar, 2025 20:47",
                      value: "\$25.90",
                    ),
                    TransactionsListItem(
                      title: "Voucher 4",
                      label: "28 Mar, 2025 20:47",
                      value: "\$25.90",
                    ),
                    TransactionsListItem(
                      title: "Voucher 1",
                      label: "28 Mar, 2025 20:47",
                      value: "\$250,000",
                    ),

                    TransactionsListItem(
                      title: "Voucher 2",
                      label: "28 Mar, 2025 20:47",
                      value: "\$1,050,000",
                    ),
                    TransactionsListItem(
                      title: "Voucher 3",
                      label: "28 Mar, 2025 20:47",
                      value: "\$25.90",
                    ),
                    TransactionsListItem(
                      title: "Voucher 4",
                      label: "28 Mar, 2025 20:47",
                      value: "\$25.90",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FiltersListItem extends StatelessWidget {
  final String label;

  const _FiltersListItem({required this.label});

  @override
  Widget build(BuildContext context) => TextButton(
    onPressed: () {},
    style: TextButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          width: 0.5,
          color: Colors.grey,
        ), // Adjust corner radius
      ),
    ),
    child: Text(label, style: TextTheme.of(context).bodySmall),
  );
}
