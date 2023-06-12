import 'package:flutter/material.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart' as tg;
import 'package:flutter_telegram_web_example/common_widgets.dart';

class TelegramDetailsView extends StatefulWidget {
  const TelegramDetailsView({super.key});

  @override
  State<TelegramDetailsView> createState() => _TelegramDetailsViewState();
}

class _TelegramDetailsViewState extends State<TelegramDetailsView> {
  @override
  void initState() {
    tg.BackButton.show();
    super.initState();
  }

  @override
  void dispose() {
    tg.BackButton.hide();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            KDetailsList("Version", tg.version),
            KDetailsList("Platform", tg.platform),
            KDetailsList("IsDarkMode", tg.isDarkMode),
            KDetailsList("ColorScheme", tg.colorScheme),
            KDetailsList("IsClosingConfirmationEnabled",
                tg.isClosingConfirmationEnabled),
            KDetailsList("IsExpanded", tg.isExpanded),
            KDetailsList("ViewportHeight", tg.viewportHeight),
            KDetailsList(
              "HeaderColor",
              tg.headerColor,
              isColor: true,
            ),
            KDetailsList(
              "ThemeBackgroundColor",
              tg.themeParams.bg_color,
              isColor: true,
            ),
            KDetailsList(
              "SecondaryBackgroundColor",
              tg.themeParams.secondary_bg_color,
              isColor: true,
            ),
            KDetailsList(
              "TextColor",
              tg.themeParams.text_color,
              isColor: true,
            ),
            KDetailsList(
              "ButtonColor",
              tg.themeParams.button_color,
              isColor: true,
            ),
          ],
        ),
      ),
    );
  }
}
