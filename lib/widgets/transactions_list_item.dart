import 'package:flutter/material.dart';

import '../assets/colors/color.dart';

class TransactionsListItem extends StatelessWidget {
  final String title;
  final String label;
  final String value;
  final VoidCallback? onPressed;

  const TransactionsListItem({
    super.key,
    required this.title,
    required this.label,
    required this.value,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            // padding: EdgeInsets.all(8),
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
            child: FilledButton(
              style: FilledButton.styleFrom(
                padding: EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Colors.transparent,
              ),
              onPressed: onPressed ?? () {},
              child: ClipOval(
                child: Container(
                  color: blue.withAlpha(40),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Image.asset(
                      "lib/assets/images/img_voucher_outlined.png",
                      width: 16,
                      height: 16,
                      fit: BoxFit.cover,
                    ),
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
            child: FilledButton(
              style: FilledButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Colors.transparent,
              ),
              onPressed: onPressed ?? () {},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 16,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextTheme.of(
                            context,
                          ).labelSmall?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 2),
                        Text(
                          label,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextTheme.of(
                            context,
                          ).labelSmall?.copyWith(fontSize: 10),
                        ),
                      ],
                    ),
                    Text(
                      value,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextTheme.of(
                        context,
                      ).labelSmall?.copyWith(fontWeight: FontWeight.bold),
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
}
