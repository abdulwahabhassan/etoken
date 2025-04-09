import 'package:etoken/data/repositories/user_repository.dart';
import 'package:etoken/ui/common/screens/qr_code_scanner_screen.dart';
import 'package:etoken/ui/common/screens/result_screen.dart';
import 'package:etoken/ui/common/screens/voucher_details_screen.dart';
import 'package:etoken/ui/features/auth/screens/login_screen.dart';
import 'package:etoken/ui/features/dashboard/screens/direct_dashboard_screen.dart';
import 'package:etoken/ui/features/dashboard/viewmodels/dircet_dashboard_screen_viewmodel.dart';
import 'package:etoken/ui/features/profile/screens/profile_screen.dart';
import 'package:etoken/ui/features/transactions/screens/transactions_screen.dart';
import 'package:etoken/ui/features/welcome/screens/welcome_screen.dart';
import 'package:go_router/go_router.dart';

const welcomeRoute = "/welcome";
const loginRoute = "/login";
const dashboardRoute = "/dashboard";
const profileRoute = "/profile";
const resultRoute = "/result";
const voucherDetailsRoute = "/voucher_details";
const qrCodeScannerRoute = "/qrcode_scanner";
const transactionsRoute = "/transactions";

final router = GoRouter(
  initialLocation: welcomeRoute,
  routes: [
    GoRoute(path: welcomeRoute, builder: (context, state) => WelcomeScreen()),
    GoRoute(path: loginRoute, builder: (context, state) => LoginScreen()),
    GoRoute(path: dashboardRoute, builder: (context, state) => DirectDashboardScreen(viewModel: DirectDashboardScreenViewModel(userRepository: UserRepository()))),
    GoRoute(path: profileRoute, builder: (context, state) => ProfileScreen()),
    GoRoute(path: resultRoute, builder: (context, state) => ResultScreen()),
    GoRoute(path: voucherDetailsRoute, builder: (context, state) => VoucherDetailsScreen()),
    GoRoute(path: qrCodeScannerRoute, builder: (context, state) => QRCodeScannerScreen(scanType: QRCodeScanType.voucher)),
    GoRoute(path: transactionsRoute, builder: (context, state) => TransactionsScreen()),
  ],
);
