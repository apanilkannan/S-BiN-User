import 'package:get/get.dart';
import 'package:s_bin/src/modules/login/bindings/login_binding.dart';
import 'package:s_bin/src/modules/login/views/login_screen.dart';
import 'package:s_bin/src/modules/map/bindings/map_binding.dart';
import 'package:s_bin/src/modules/map/views/map_screen.dart';
import 'package:s_bin/src/modules/marker_detail/bindings/marker_detail_binding.dart';
import 'package:s_bin/src/modules/marker_detail/views/marker_detail_screen.dart';
import 'package:s_bin/src/modules/sign_up/bindings/sign_up_binding.dart';
import 'package:s_bin/src/modules/sign_up/views/sign_up_screen.dart';
import 'package:s_bin/src/routes/app_routes.dart';

class AppPages {
  static const initialRoute = AppRoutes.googleMap;

  static final routes = [
    GetPage(
        name: AppRoutes.login,
        page: () => const LoginScreen(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.signUp,
        page: () => const SignUpScreen(),
        binding: SignUpBinding()),
    GetPage(
        name: AppRoutes.googleMap,
        page: () => const MapScreen(),
        binding: MapBinding()),
    GetPage(
        name: AppRoutes.markerDetail,
        page: () => MarkerDetailScreen(),
        binding: MarkerDetailBinding())
  ];
}
