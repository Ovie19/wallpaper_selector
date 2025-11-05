import 'package:flutter/cupertino.dart';

const double _kMobileMax = 600;
const double _kTabletMax = 1200;

extension ResponsiveContextExtension on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;

  double get height => MediaQuery.sizeOf(this).height;

  bool get isMobile => width < _kMobileMax;

  bool get isTablet => width <= _kMobileMax && width < _kTabletMax;

  bool get isDesktop => width >= _kTabletMax;
}
