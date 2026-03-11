import 'package:ateam_software_test/common/constants/app_gradient.dart';
import 'package:ateam_software_test/common/constants/app_text_style.dart';
import 'package:ateam_software_test/presentation/theme/theme_color.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class BottomBarItemData {
  /// [icon] supported [String, IconData, Widget]
  final dynamic icon;

  /// [selectedIcon] supported [String, IconData, Widget, NULL]
  final dynamic selectedIcon;
  final bool? isOver;
  final int? badgeCount;
  final String? title;

  BottomBarItemData({
    this.icon,
    this.selectedIcon,
    this.isOver,
    this.badgeCount,
    this.title,
  });
}

class CustomBottomNavigationBar extends StatefulWidget {
  final Future<bool> Function(int)? onItemSelection;
  final int? selectedIdx;
  final List<BottomBarItemData>? items;

  const CustomBottomNavigationBar({
    super.key,
    this.onItemSelection,
    this.selectedIdx = 0,
    this.items,
  });
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  late ValueNotifier<int> idxNotifier;

  @override
  void initState() {
    idxNotifier = ValueNotifier(widget.selectedIdx ?? 0);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    idxNotifier = ValueNotifier(widget.selectedIdx ?? 0);
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant CustomBottomNavigationBar oldWidget) {
    idxNotifier = ValueNotifier(widget.selectedIdx ?? 0);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    idxNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ValueListenableBuilder<int>(
          valueListenable: idxNotifier,
          builder: (ctx, value, w) {
            final itemWidth =
                (constraints.maxWidth - 32) / widget.items!.length;
            return Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 30,
                        color: Color(0xFF08091C).withOpacity(0.1),
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.fromLTRB(
                    10.5.w,
                    0,
                    10.5.w,
                    MediaQuery.of(context).viewPadding.bottom + 8.w,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.items!.mapIndexed<Widget>((idx, item) {
                      return SizedBox(
                        width: itemWidth,
                        child: BottomItem(
                          item: item,
                          onPressed: () async {
                            if (idx != value &&
                                await widget.onItemSelection?.call(idx) ==
                                    true) {
                              idxNotifier.value = idx;
                            }
                          },
                          selected: idx == value,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class BottomItem extends StatelessWidget {
  final BottomBarItemData item;
  final void Function()? onPressed;
  final bool selected;
  final double iconSize;

  const BottomItem({
    super.key,
    required this.item,
    this.onPressed,
    this.selected = false,
    this.iconSize = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    assert(
      item.icon is String || item.icon is IconData || item.icon is Widget,
      'BottomBarItemData.icon supported [String, IconData, Widget]',
    );
    assert(
      item.selectedIcon == null ||
          item.selectedIcon is String ||
          item.selectedIcon is IconData ||
          item.selectedIcon is Widget,
      '''BottomBarItemData.selectedIcon supported [String, IconData, Widget, NULL]''',
    );
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Animated indicator bar
            SizedBox(height: 16.w),
            _buildIcon(),
            if (item.title != null) ...[
              SizedBox(height: 8.w),
              selected
                  ? GradientText(
                      item.title!,
                      style: AppTextStyle.caption,
                      colors: AppGradient.colors,
                    )
                  : Text(
                      item.title!,
                      style: AppTextStyle.caption.copyWith(
                        color: ThemeColor.color7D7F88,
                      ),
                    ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    final icon =
        (selected == true ? item.selectedIcon : item.icon) ?? item.icon;
    if (icon is Widget) {
      return icon;
    }
    if (icon is IconData) {
      return Icon(icon, size: iconSize);
    }
    if (icon is! String) {
      return const SizedBox();
    }
    return SvgPicture.asset(
      icon,
      width: iconSize,
      height: iconSize,
      fit: BoxFit.cover,
    );
  }
}
