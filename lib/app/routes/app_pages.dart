import 'package:get/get.dart';
// import 'package:job_portal/app/bindings/company_listing_binding.dart';
import 'package:job_portal/app/routes/app_routes.dart';
import 'package:job_portal/ui/screens/company_listing_screen.dart';
import 'package:job_portal/ui/screens/login_screen.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: Routes.companyListing,
      page: () => const CompanyListingScreen(),
    ),
  ];
}
