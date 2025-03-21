import 'dart:async';
// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:web/web.dart' show window;

/// A web implementation of the RazorpayFlutterCustomui plugin.
class RazorpayFlutterCustomuiWeb {
  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
      'razorpay_flutter_customui',
      const StandardMethodCodec(),
      registrar,
    );

    final pluginInstance = RazorpayFlutterCustomuiWeb();
    channel.setMethodCallHandler(pluginInstance.handleMethodCall);
  }

  /// Handles method calls over the MethodChannel of this plugin.
  /// Note: Check the "federated" architecture for a new way of doing this:
  /// https://flutter.dev/go/federated-plugins
  Future<dynamic> handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'getPlatformVersion':
        return getPlatformVersion();
      default:
        throw PlatformException(
          code: 'Unimplemented',
          details: 'razorpay_flutter_customui for web doesn\'t implement \'${call.method}\'',
        );
    }
  }

  /// Returns a [String] containing the version of the platform.
  Future<String> getPlatformVersion() {
    final version = window.navigator.userAgent;
    return Future.value(version);
  }
}
