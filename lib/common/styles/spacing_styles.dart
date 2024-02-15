import 'package:flutter/cupertino.dart';

import '../../utils/constants/sizes.dart';

class SpacingStyles {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
      top: Sizes.appBarHeight,
      bottom: Sizes.defaultSpace,
      left: Sizes.defaultSpace,
      right: Sizes.defaultSpace
  );
}