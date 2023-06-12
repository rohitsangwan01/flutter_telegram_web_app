import '../flutter_telegram_web.dart';

enum PopupButtonType { cancel, ok, close, destructive }

class TelegramPopup {
  String title;
  String message;
  List<PopupButton>? buttons;
  Function(String buttonId)? onTap;

  TelegramPopup({
    required this.title,
    required this.message,
    this.buttons,
    this.onTap,
  });

  /// use [TelegramPopup.show()] to show the popup
  void show() {
    var buttonsList = buttons
        ?.map((PopupButton? e) =>
            (id: e?.id, type: e?.type?.name ?? "default", text: e?.text))
        .toList();
    showPopup(
      (
        title: title,
        message: message,
        buttons: buttonsList ?? [(id: "cancel", type: "cancel", text: "Cancel")]
      ),
      JsCallback<String>((String buttonId) {
        onTap?.call(buttonId);
      }),
    );
  }
}

class PopupButton {
  String id;
  PopupButtonType? type;
  String? text;
  PopupButton({
    required this.id,
    this.type,
    this.text,
  });
}
