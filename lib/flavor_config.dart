import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Flavor {
  red,
  blue,
}

class FlavorConfig extends GetxService {
  final Flavor flavor;
  final String name;
  final Color color;
  static FlavorConfig? _instance;

  factory FlavorConfig(
      {required Flavor flavor, Color color = Colors.blue, String? name}) {
    _instance ??= FlavorConfig._internal(
      flavor,
      name ?? flavor.toString(),
      color,
    );
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.name, this.color);

  static FlavorConfig get instance {
    return _instance!;
  }

  static bool isRedFlavor() => _instance?.flavor == Flavor.red;
  static bool isBlueFlavor() => _instance?.flavor == Flavor.blue;
}
