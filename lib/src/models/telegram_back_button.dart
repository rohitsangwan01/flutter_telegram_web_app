import 'package:js/js.dart';

///https://core.telegram.org/bots/webapps#backbutton
@JS()
class TelegramBackButton {
  external bool isVisible;
  external void onClick(jsVoidCallback);
  external void offClick(jsVoidCallback);
  external Future show();
  external Future hide();
}
