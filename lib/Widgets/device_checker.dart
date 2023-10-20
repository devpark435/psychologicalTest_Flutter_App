import 'dart:html' as html;

class DeviceChecker {
  bool get isMobileDevice {
    var userAgent = html.window.navigator.userAgent;
    return userAgent.contains('Mobile') ||
        userAgent.contains('Android') ||
        userAgent.contains('iPhone');
  }
}
