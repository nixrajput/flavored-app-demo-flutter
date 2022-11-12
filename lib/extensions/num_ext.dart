import 'package:flutter/material.dart';

extension NumExtension on num {
  SizedBox toSizedBoxHeight() => SizedBox(height: toDouble());
  SizedBox toSizedBoxWidth() => SizedBox(width: toDouble());
  SizedBox toSquare() => SizedBox(width: toDouble(), height: toDouble());
}
