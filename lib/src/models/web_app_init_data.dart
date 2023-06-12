// ignore_for_file: non_constant_identifier_names

import 'package:flutter_telegram_web_app/src/models/web_app_chat.dart';
import 'package:flutter_telegram_web_app/src/models/web_app_user.dart';
import 'package:js/js.dart';

/// https://core.telegram.org/bots/webapps#webappinitdata
@JS()
class WebAppInitData {
  external String? get query_id;
  external WebAppUser? get user;
  external WebAppUser? get receiver;
  external WebAppChat? get chat;
  external String? get chat_type;
  external String? get chat_instance;
  external String? get start_param;
  external int? get can_send_after;
  external int? get auth_date;
  external String? get hash;
}
