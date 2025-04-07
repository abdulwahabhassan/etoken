import 'package:flutter/material.dart';

class IssueVoucherDialog extends StatelessWidget {
  const IssueVoucherDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      alignment: Alignment.center,
      actionsOverflowAlignment: OverflowBarAlignment.center,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.print_rounded, size: 24),
          SizedBox(height: 16),
          Text(
            textAlign: TextAlign.center,
            "Do you confirm you want to issue voucher and print receipt?",
            style: TextTheme.of(
              context,
            ).labelMedium?.copyWith(color: Colors.black),
          ),
        ],
      ),
      actions: [
        SizedBox(
          height: 36,
          width: double.infinity,
          child: TextButton.icon(
            iconAlignment: IconAlignment.end,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.done_all_rounded, color: Colors.green, size: 16),
            label: Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                "Yes, Proceed",
                style: TextTheme.of(
                  context,
                ).labelSmall?.copyWith(color: Colors.deepPurple),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(width: 0.5, color: Colors.grey),
              ),
            ),
          ),
        ),
        SizedBox(height: 8,),
        SizedBox(
          height: 36,
          width: double.infinity,
          child: TextButton.icon(
            iconAlignment: IconAlignment.end,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.cancel_rounded, color: Colors.red, size: 16),
            label: Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                "No, Cancel",
                style: TextTheme.of(
                  context,
                ).labelSmall?.copyWith(color: Colors.deepPurple),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(width: 0.5, color: Colors.grey),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
