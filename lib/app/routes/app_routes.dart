part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const PROFILE = _Paths.PROFILE;
  static const COUNTER = _Paths.COUNTER;
  static const FORMULIR = _Paths.FORMULIR;
  static const PAYMENT = _Paths.PAYMENT;
  static const PAYMENT_OUPUT = _Paths.PAYMENT_OUPUT;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const EVENT = _Paths.EVENT;
  static const CATEGORY = _Paths.CATEGORY;
  static const CATEGORY_ADD = _Paths.CATEGORY_ADD;
  static const CATEGORY_EDIT = _Paths.CATEGORY_EDIT;
  static const CATEGORY_SHOW = _Paths.CATEGORY_SHOW;
  static const BUTTON_NAVIGATION = _Paths.BUTTON_NAVIGATION;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const PROFILE = '/profile';
  static const COUNTER = '/counter';
  static const FORMULIR = '/formulir';
  static const PAYMENT = '/payment';
  static const PAYMENT_OUPUT = '/payment_output';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const EVENT = '/event';
  static const CATEGORY = '/category';
  static const CATEGORY_ADD = '/category/add';
  static const CATEGORY_EDIT = '/category/edit';
  static const CATEGORY_SHOW = '/category/show';
  static const BUTTON_NAVIGATION = '/';
}
