import Flutter
import UIKit
import GoogleMaps


@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    GMSServices.provideAPIKey("AIzaSyB3gfB_-EnxClHbLwQ_abJr3IIaGJ-c4zg")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
