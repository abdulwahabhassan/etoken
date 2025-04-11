import 'package:etoken/ui/navigation/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../redemption/widgets/voucher_code_dialog.dart';


class RedeemVoucherDialog extends StatelessWidget {
  const RedeemVoucherDialog({super.key});

  @override
  Widget build(BuildContext context) {
   return AlertDialog(
     actionsAlignment: MainAxisAlignment.center,
     title: Column(
       children: [
         Icon(Icons.redeem_rounded, size: 24),
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
             context.pop();
             // Navigator.pop(context);
             showDialog(
               context: context,
               builder:
                   (context) => VoucherCodeDialog(),
             );
           },
           style: FilledButton.styleFrom(
             backgroundColor: Colors.transparent,
             shape: RoundedRectangleBorder(
               borderRadius:
               BorderRadius.circular(24),
               side: BorderSide(
                 color: Colors.grey,
                 width: 0.5,
               ),
             ),
           ),
           child: Row(
             mainAxisAlignment:
             MainAxisAlignment.center,
             spacing: 8,
             children: [
               Flexible(child: Text(
                 "Enter Voucher Code",
                 style: TextTheme.of(
                   context,
                 ).labelSmall?.copyWith(
                   color: Colors.deepPurple,
                   overflow: TextOverflow.ellipsis,
                 ),
               )),
               Icon(
                 Icons.keyboard_alt_outlined,
                 size: 16,
                 color: Colors.deepPurple,
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
             context.pop();
             // Navigator.pop(context);
             context.push(qrCodeScannerRoute);
             // Navigator.of(context).push(
             //   MaterialPageRoute(
             //     builder:
             //         (
             //         builder,
             //         ) => QRCodeScannerScreen(scanType: QRCodeScanType.voucher),
             //   ),
             // );
           },
           style: FilledButton.styleFrom(
             backgroundColor: Colors.transparent,
             shape: RoundedRectangleBorder(
               borderRadius:
               BorderRadius.circular(24),
               side: BorderSide(
                 color: Colors.grey,
                 width: 0.5,
               ),
             ),
           ),
           child: Row(
             mainAxisAlignment:
             MainAxisAlignment.center,
             spacing: 8,
             children: [
               Flexible(child: Text(
                 "Scan",
                 style: TextTheme.of(
                   context,
                 ).labelSmall?.copyWith(
                   color: Colors.deepPurple,
                 ),
                 overflow: TextOverflow.ellipsis,
               )),
               Icon(
                 Icons.qr_code_scanner_rounded,
                 size: 16,
                 color: Colors.deepPurple,
               ),
             ],
           ),
         ),
       ),
     ],
   );
  }

}