import 'package:app_write_demo/app/modules/home/home_binding.dart';
import 'package:app_write_demo/app/modules/home/home_view.dart';
import 'package:app_write_demo/app/modules/login/login_binding.dart';
import 'package:app_write_demo/app/modules/login/login_view.dart';
import 'package:app_write_demo/app/modules/splash/splash_binding.dart';
import 'package:app_write_demo/app/modules/splash/splash_view.dart';
import 'package:get/get.dart';

class Pages {
  static final List<GetPage> pages = [
    GetPage(
        name: '/splash', page: () => SplashPage(), binding: SplashBinding()),
    GetPage(name: '/login', page: () => LoginPage(), binding: LoginBinding()),
    GetPage(name: '/home', page: () => HomePage(), binding: HomeBinding()),
  ];
}
