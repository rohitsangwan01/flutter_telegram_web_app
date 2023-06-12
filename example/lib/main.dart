import 'package:flutter/material.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart' as tg;
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart';
import 'package:flutter_telegram_web_example/home_view.dart';

void main() {
  runApp(const MyApp());
}

// user below method to update theme mode
void updateThemeMode() {
  _notifier.value = tg.isDarkMode ? ThemeMode.dark : ThemeMode.light;
}

final ValueNotifier<ThemeMode> _notifier =
    ValueNotifier(tg.isDarkMode ? ThemeMode.dark : ThemeMode.light);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _notifier,
      builder: (_, mode, __) {
        return MaterialApp(
          title: "Telegram Web JS",
          debugShowCheckedModeBanner: false,
          theme: TelegramTheme.light,
          darkTheme: TelegramTheme.dark,
          themeMode: mode,
          home: const HomeView(),
        );
      },
    );
  }
}
