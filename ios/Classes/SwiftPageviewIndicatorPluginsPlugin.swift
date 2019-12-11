import Flutter
import UIKit

public class SwiftPageviewIndicatorPluginsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "pageview_indicator_plugins", binaryMessenger: registrar.messenger())
    let instance = SwiftPageviewIndicatorPluginsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
