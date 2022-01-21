import 'package:flutter/material.dart';

///spacing widgets helper
class UIHelper {
  //define spaces
  static const double _spaceVerySmall = 4.0;
  static const double _spaceSmall = 8.0;
  static const double _spaceMedium = 16.0;
  static const double _spaceLarge = 32.0;

  ///vertical very small
  static Widget verticalSpaceVerySmall() {
    return verticalSpace(_spaceVerySmall);
  }

  ///vertical small
  static Widget verticalSpaceSmall() {
    return verticalSpace(_spaceSmall);
  }

  ///vertical medium
  static Widget verticalSpaceMedium() {
    return verticalSpace(_spaceMedium);
  }

  ///vertical large
  static Widget verticalSpaceLarge() {
    return verticalSpace(_spaceLarge);
  }

  ///horizontal very small
  static Widget horizontalSpaceVerySmall() {
    return horizontalSpace(_spaceVerySmall);
  }

  ///horizontal small
  static Widget horizontalSpaceSmall() {
    return horizontalSpace(_spaceSmall);
  }

  ///horizontal medium
  static Widget horizontalSpaceMedium() {
    return horizontalSpace(_spaceMedium);
  }

  ///horizontal large
  static Widget horizontalSpaceLarge() {
    return horizontalSpace(_spaceLarge);
  }

  ///vertical sized box
  static Widget verticalSpace(double size) {
    return SizedBox(height: size);
  }

  ///horizontal sized bos
  static Widget horizontalSpace(double size) {
    return SizedBox(width: size);
  }
}
