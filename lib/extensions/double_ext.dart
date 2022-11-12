import 'package:flutter/material.dart';

extension DoubleExtension on double {
  EdgeInsets edgeInsets() => EdgeInsets.all(this);
  EdgeInsets edgeInsetsHorizontal() => EdgeInsets.symmetric(horizontal: this);
  EdgeInsets edgeInsetsVertical() => EdgeInsets.symmetric(vertical: this);
}
