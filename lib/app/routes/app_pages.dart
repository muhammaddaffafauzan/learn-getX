import 'package:get/get.dart';

import '../middlewares/auth_middleware.dart';
import '../modules/button_navigation/bindings/button_navigation_binding.dart';
import '../modules/button_navigation/views/button_navigation_view.dart';
import '../modules/category/bindings/category_binding.dart';
import '../modules/category/views/category_add.dart';
import '../modules/category/views/category_edit.dart';
import '../modules/category/views/category_show.dart';
import '../modules/category/views/category_view.dart';
import '../modules/counter/bindings/counter_binding.dart';
import '../modules/counter/views/counter_view.dart';
import '../modules/event/bindings/event_binding.dart';
import '../modules/event/views/event_view.dart';
import '../modules/formulir/bindings/formulir_binding.dart';
import '../modules/formulir/views/formulir_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/payment/bindings/payment_binding.dart';
import '../modules/payment/views/payment_output.dart';
import '../modules/payment/views/payment_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BUTTON_NAVIGATION;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      // middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
      // middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: _Paths.COUNTER,
      page: () => CounterView(),
      binding: CounterBinding(),
      // middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: _Paths.FORMULIR,
      page: () => FormulirView(),
      binding: FormulirBinding(),
      // middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => PaymentView(),
      binding: PaymentBinding(),
      // middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: _Paths.PAYMENT_OUPUT,
      page: () => PaymentOutput(dataFormulir: Get.arguments),
      // middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
      // middlewares: [AuthCheckMiddleware()]
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
      // middlewares: [AuthCheckMiddleware()]
    ),
    GetPage(
      name: _Paths.EVENT,
      page: () => EventView(),
      binding: EventBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY,
      page: () => CategoryView(),
      binding: CategoryBinding(),
      // middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: _Paths.CATEGORY_ADD,
      page: () => CategoryAddView(),
      binding: CategoryBinding(),
      // middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: _Paths.CATEGORY_EDIT,
      page: () => CategoryEditView(category: Get.arguments),
      // middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.CATEGORY_SHOW,
      page: () => CategoryShowView(category: Get.arguments),
      // middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.BUTTON_NAVIGATION,
      page: () => ButtonNavigationView(),
      binding: ButtonNavigationBinding(),
      middlewares: [AuthMiddleware()],
    ),
  ];
}
