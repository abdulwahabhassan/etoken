import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorDialog extends StatelessWidget {
  final String error;
  final VoidCallback onRetryPressed;

  const ErrorDialog({
    super.key,
    required this.error,
    required this.onRetryPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      title: Column(
        children: [
          Icon(Icons.error_rounded, size: 24, color: Colors.red),
          SizedBox(height: 16),
          Text(
            error,
            textAlign: TextAlign.center,
            style: TextTheme.of(
              context,
            ).labelMedium?.copyWith(color: Colors.black),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      actions: [
        SizedBox(
          width: double.infinity,
          height: 36,
          child: FilledButton(
            onPressed: () {
              // context.pop();
              onRetryPressed();
            },
            style: FilledButton.styleFrom(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                side: BorderSide(color: Colors.grey, width: 0.5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                Flexible(
                  child: Text(
                    "Retry",
                    style: TextTheme.of(
                      context,
                    ).labelSmall?.copyWith(color: Colors.deepPurple),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(Icons.refresh_rounded, size: 16, color: Colors.deepPurple),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
