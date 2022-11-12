import 'package:flavored_app_demo/modules/details/details_view.dart';
import 'package:flavored_app_demo/modules/home/home_binding.dart';
import 'package:flavored_app_demo/modules/home/home_view.dart';
import 'package:get/get.dart';

part 'routes.dart';

abstract class AppPages {
  static var transitionDuration = const Duration(milliseconds: 500);
  static var defaultTransition = Transition.circularReveal;

  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: HomeView.new,
      binding: HomeBinding(),
      transitionDuration: transitionDuration,
      transition: defaultTransition,
    ),
    GetPage(
      name: AppRoutes.details,
      page: DetailsView.new,
      transitionDuration: transitionDuration,
      transition: defaultTransition,
    ),
  ];
}
