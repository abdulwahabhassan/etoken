import 'package:etoken/ui/navigation/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../data/repositories/user_repository.dart';
import '../../../common/theme/colors.dart';
import '../../dashboard/screens/direct_dashboard_screen.dart';
import '../../dashboard/screens/tally_dashboard_screen.dart';
import '../../dashboard/viewmodels/dircet_dashboard_screen_viewmodel.dart';


class RedemptionPointCodeDialog extends StatefulWidget {
  const RedemptionPointCodeDialog({super.key});

  @override
  State<RedemptionPointCodeDialog> createState() => _RedemptionPointDialogState();
}

class _RedemptionPointDialogState extends State<RedemptionPointCodeDialog> {
  TextEditingController redemptionPointCodeTextFieldController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
          (_) => FocusScope.of(context).requestFocus(focusNode),
    );
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.login_rounded, size: 24),
          SizedBox(height: 16),
          Text(
            "Enter redemption point code to complete login",
            textAlign: TextAlign.center,
            style: TextTheme.of(
              context,
            ).labelMedium?.copyWith(color: Colors.black),
          ),
        ],
      ),
      content: TextField(
        controller: redemptionPointCodeTextFieldController,
        style: TextTheme.of(context).bodyMedium,
        cursorColor: blue.withAlpha(100),
        decoration: InputDecoration(
          hintText: "Redemption Point Code",
          hintStyle: TextTheme.of(context).labelSmall?.copyWith(
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
          fillColor: blue.withAlpha(16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          isDense: true,
          filled: true,
          isCollapsed: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
        textAlign: TextAlign.center,
        focusNode: focusNode,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      actions: [
        SizedBox(
          height: 36,
          child: TextButton.icon(
            iconAlignment: IconAlignment.end,
            onPressed: () {
              context.pop();
              FocusScope.of(context).unfocus();
              context.push(dashboardRoute);
            },
            icon: Icon(
              Icons.keyboard_double_arrow_right_rounded,
              color: Colors.green,
              size: 16,
            ),
            label: Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                "Proceed",
                style: TextTheme.of(
                  context,
                ).labelSmall?.copyWith(color: Colors.deepPurple),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                side: BorderSide(width: 0.5, color: Colors.grey),
              ),
            ),
          ),
        ),
      ],
    );
}}
