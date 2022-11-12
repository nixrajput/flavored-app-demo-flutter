# flavored_app_demo

A flutter app that demonstrates how to use the `flavor` and `JSON` in Flutter application.

## Project Setup

1. Exctract ZIP file and open the project in Android Studio or VS Code.

2. Run `flutter pub get` to install the dependencies.

## Run Command

- Run `blueFlavor` app using `flutter run` command.

```bash
flutter run --flavor blueFlavor -t lib/main_blue.dart
```

- Run `redFlavor` app using `flutter run` command.

```bash
flutter run --flavor redFlavor -t lib/main_red.dart
```

## Build Command

- Build `blueFlavor` app using `flutter build` command.

```bash
flutter build apk --flavor blueFlavor -t lib/main_blue.dart
```

- Build `redFlavor` app using `flutter build` command.

```bash
flutter build apk --flavor redFlavor -t lib/main_red.dart
```

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the [online documentation](https://docs.flutter.dev/), which offers tutorials, samples, guidance on mobile development, and a full API reference.
