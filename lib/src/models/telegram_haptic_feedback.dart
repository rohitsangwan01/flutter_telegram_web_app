import 'package:js/js.dart';

///https://core.telegram.org/bots/webapps#hapticfeedback
@JS()
class TelegramHapticFeedback {
  external void impactOccurred(style);
  external void notificationOccurred(type);
  external void selectionChanged();
}
