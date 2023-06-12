@JS("Telegram.WebApp")
library telegram_webapp;

import 'package:js/js.dart';
import 'models/models_export.dart';

/// All the properties and methods of the Telegram Web JS API
/// https://core.telegram.org/bots/webapps
///
/// [isDarkMode] is reliable only if used inside Telegram web
bool get isDarkMode => colorScheme == "dark";

/// [isSupported] will return true only if opened inside Telegram web
bool get isSupported => platform.toLowerCase() != "unknown";

/// Getters for properties
///
external String get initData;
external String get version;
external String get platform;
external String get colorScheme;
external String get headerColor;
external String get backgroundColor;
external bool get isClosingConfirmationEnabled;
external bool get isExpanded;
external double? get viewportHeight;
external double? get viewportStableHeight;

/// Getters for classes and objects
///
external ThemeParams get themeParams;
external TelegramBackButton get BackButton;
external TelegramMainButton get MainButton;
external WebAppInitData get initDataUnsafe;
external TelegramHapticFeedback get HapticFeedback;

/// Functions
///
external Future<void> ready();
external Future<void> expand();
external Future<void> close();
external Future<void> enableClosingConfirmation();
external Future<void> disableClosingConfirmation();
external Future<void> sendData(dynamic data);
external Future<void> isVersionAtLeast(version);
external Future<void> setHeaderColor(String color);
external Future<void> setBackgroundColor(String color);
external Future<void> switchInlineQuery(query, [choose_chat_types]);
external Future<void> openLink(url, [options]);
external Future<void> openTelegramLink(String url);
external Future<void> openInvoice(String url, [JsCallback]);
external Future<void> readTextFromClipboard(JsCallback);

///Dialogs
///
/// use [TelegramPopup.show()] to show the popup, instead of this method directly
external Future<void> showPopup(Record param, [JsCallback]);
external Future<void> showAlert(String message, [JsCallback]);
external Future<void> showConfirm(String message, [JsCallback]);
external Future<void> showScanQrPopup(Record params, [JsCallback]);
external Future<void> closeScanQrPopup();

///Events
///
/// Available events: https://core.telegram.org/bots/webapps#events-available-for-web-apps
/// use [TelegramWebEventType] to get the event names, and use [JsVoidCallback] for callbacks
/// or if any callback requires a return value, use [JsCallback] with the return type
external void onEvent(String eventType, JsCallback);
external void offEvent(String eventType, JsCallback);

///Callbacks
///
/// Always use these method for callbacks
JsCallback<T>(Function(T) callback) => allowInterop(callback);
JsVoidCallback(Function() callback) => allowInterop(callback);
