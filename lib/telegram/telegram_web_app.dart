import 'dart:js' as js;

/// Wrapper for Telegram Web App JS functionality.
class TelegramWebApp {
  /// Checks if the Telegram Web App API is available.
  static bool get isAvailable {
    try {
      return js.context.hasProperty('Telegram') && (js.context['Telegram'] as js.JsObject).hasProperty('WebApp');
    } catch (_) {
      return false;
    }
  }

  /// Notifies Telegram that the Web App is ready.
  static void ready() {
    try {
      js.context.callMethod('tgWebAppReady', []);
    } catch (_) {
      // no-op if not in Telegram
    }
  }

  /// Sends data back to the Telegram bot.
  static void sendData(Map<String, dynamic> data) {
    try {
      js.context.callMethod('tgSendData', [data]);
    } catch (_) {
      // no-op if not in Telegram
    }
  }
}
