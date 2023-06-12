// ignore_for_file: non_constant_identifier_names

import 'package:js/js.dart';

///https://core.telegram.org/bots/webapps#themeparams
@JS()
class ThemeParams {
  external String get bg_color;
  external String get text_color;
  external String get hint_color;
  external String get link_color;
  external String get button_color;
  external String get button_text_color;
  external String get secondary_bg_color;
}
