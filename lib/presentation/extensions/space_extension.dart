import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SpaceExtension on num {
  SizedBox get hSpace => SizedBox(width: toDouble().w);

  SizedBox get vSpace => SizedBox(height: toDouble().h);
}