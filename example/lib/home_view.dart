import 'package:flutter/material.dart';

import 'package:flutter_telegram_web_example/common_widgets.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart' as tg;
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart';
import 'package:flutter_telegram_web_example/main.dart';
import 'package:flutter_telegram_web_example/telegram_details_view.dart';
import 'package:flutter_telegram_web_example/user_details_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TelegramMainButton _mainButton = tg.MainButton;
  final TelegramBackButton _backButton = tg.BackButton;
  bool isStateStable = true;

  @override
  void initState() {
    onEvent(TelegramWebEventType.settingsButtonClicked, JsVoidCallback(() {
      print("settingsButtonClicked");
      setState(() {});
    }));

    _mainButton.onClick(JsVoidCallback(() {
      // we can also use onEvent(TelegramWebEventType.mainButtonClicked)
      tg.showConfirm("Main Button Clicked");
      setState(() {});
    }));

    _backButton.onClick(JsVoidCallback(() {
      // we can also use onEvent(TelegramWebEventType.backButtonClicked)
      Navigator.of(context).pop();
    }));

    TelegramWebEvent.setThemeChangeListener(
        (bool isDarkMode, ThemeParams themeParams) {
      setState(() {});
      updateThemeMode();
    });

    TelegramWebEvent.setViewPortChangeListener(
        (bool isStable, height, stableHeight) {
      setState(() {
        isStateStable = isStable;
      });
    });

    super.initState();
  }

  void onShowPopup() {
    TelegramPopup(
      title: "Title",
      message: "Message",
      buttons: [
        PopupButton(
          id: "delete",
          type: PopupButtonType.destructive,
          text: "Delete button test",
        ),
        PopupButton(
          id: "faq",
          text: "Open FAQ",
        ),
        PopupButton(
          id: "cancel",
          type: PopupButtonType.cancel,
        ),
      ],
      onTap: (String buttonId) {
        if (buttonId == "cancel") return null;
        if (buttonId == "faq") return tg.openLink("https://telegram.org/faq");
        showAlert("Button $buttonId clicked");
      },
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Buttons
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Opened in telegram : ${tg.isSupported},"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Platform : ${tg.platform}"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("IsDarkMode : $isDarkMode"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("IsExpanded : ${tg.isExpanded}"),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "Viewport- Height: ${tg.viewportHeight?.toInt()}, StableHeight: ${tg.viewportStableHeight?.toInt()}"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("IsStateStable: $isStateStable"),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                KButton(
                    text: "Toggle Back Button",
                    onTap: () async {
                      try {
                        var data = _backButton.isVisible
                            ? await _backButton.hide()
                            : await _backButton.show();
                        print("ToggleBackButton: $data");
                      } catch (e) {
                        print("ToggleBackButtonError: $e");
                      }
                    }),
                KButton(
                    text: "Toggle Main Button",
                    onTap: () async {
                      try {
                        _mainButton.isVisible
                            ? await _mainButton.hide()
                            : await _mainButton.show();
                      } catch (e) {
                        print("ToggleMainButtonError: $e");
                      }
                    }),
              ],
            ),
            const Divider(),
            Row(
              children: [
                const KButton(text: "Expand", onTap: tg.expand),
                const KButton(text: "Close", onTap: tg.close),
                KButton(text: "Popup", onTap: onShowPopup),
                KButton(
                    text: "Alert",
                    onTap: () async {
                      try {
                        await tg.showAlert("Alert Message");
                      } catch (e) {
                        print("Error: $e");
                      }
                    }),
              ],
            ),
            const Divider(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  KButton(
                    text: "ShowScanQr",
                    onTap: () => tg.showScanQrPopup((
                      text: "Scan QR",
                      JsCallback<dynamic>((data) {
                        showAlert(data?.toString() ?? "data is null");
                      })
                    )),
                  ),
                  KButton(
                    text: "CloseScanQr",
                    onTap: () => tg.closeScanQrPopup(),
                  ),
                  KButton(
                    text: "ClipboardText",
                    onTap: () => tg.readTextFromClipboard(
                        JsCallback<dynamic>((dynamic data) {
                      showAlert(data?.toString() ?? "data is null");
                    })),
                  ),
                ],
              ),
            ),
            const Divider(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  KButton(
                    text: "EnableClosingConfirmation",
                    onTap: () => tg.enableClosingConfirmation(),
                  ),
                  KButton(
                    text: "DisableClosingConfirmation",
                    onTap: () => tg.disableClosingConfirmation(),
                  ),
                ],
              ),
            ),

            const Divider(),
            Row(
              children: [
                KButton(
                    text: "Telegram Details >",
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const TelegramDetailsView()));
                    }),
                KButton(
                    text: "Chat Details >",
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const UserDetailsView()));
                    }),
              ],
            ),
            const Divider(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  KButton(
                    text: "SendData",
                    onTap: () => tg.sendData("Hello from Flutter"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
