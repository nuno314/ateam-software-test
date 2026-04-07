import 'dart:math' as math;

import 'package:ateam_software_test/common/constants/app_radius.dart';
import 'package:ateam_software_test/common/constants/app_spacing.dart';
import 'package:ateam_software_test/common/constants/app_text_style.dart';
import 'package:ateam_software_test/gen/assets.gen.dart';
import 'package:ateam_software_test/presentation/extensions/space_extension.dart';
import 'package:ateam_software_test/presentation/modules/auth/login_screen.dart';
import 'package:ateam_software_test/presentation/theme/theme_color.dart';
import 'package:ateam_software_test/presentation/widgets/app_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardScreen extends StatefulWidget {
  static String path = 'onboard';
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: ThemeColor.white, body: _buildBody());
  }

  Widget _buildBody() {
    final media = MediaQuery.of(context);
    final screenH = media.size.height;
    final carouselHeight = math.min(
      508.h,
      (screenH * 0.46).clamp(260.h, 508.h),
    );

    return Container(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.md,
        media.padding.top + AppSpacing.md,
        AppSpacing.md,
        media.padding.bottom + AppSpacing.md,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: carouselHeight,
              child: Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCarouselColumn(carouselHeight),
                      _buildCarouselColumn(
                        carouselHeight,
                        indexes: const [2, 1, 3, 0],
                        reverse: true,
                      ),
                      _buildCarouselColumn(
                        carouselHeight,
                        indexes: const [2, 1, 3, 0],
                      ),
                    ],
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    height: carouselHeight * 0.38,
                    child: IgnorePointer(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              ThemeColor.white.withValues(alpha: 0.1),
                              ThemeColor.white,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Text(
              'New Place, New Home!',
              style: AppTextStyle.textBold24px,

              textAlign: TextAlign.center,
            ),
            8.vSpace,
            Text(
              'Are you ready to uproot and start over in a new area? Placoo will help you on your journey!',
              style: AppTextStyle.textRegular24px,
              textAlign: TextAlign.center,
            ),
            32.vSpace,
            AppButton.primary(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  LoginScreen.path,
                );
              },
              child: Text('Login', style: AppTextStyle.textMedium24px),
            ),
            12.vSpace,
            AppButton.outline(
              onTap: () {},
              child: Text(
                'Sign up',
                style: AppTextStyle.textMedium24px.copyWith(
                  color: ThemeColor.color475569,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselColumn(
    double carouselHeight, {
    List<int> indexes = const [0, 1, 2, 3],
    bool reverse = false,
  }) {
    final maxSlot = (carouselHeight - 10.h) / 2;
    final slot = math.min(220.h, maxSlot);

    return Expanded(
      child: CarouselSlider(
        disableGesture: true,
        options: CarouselOptions(
          height: carouselHeight,
          viewportFraction: 1,
          autoPlay: true,
          scrollDirection: Axis.vertical,
          reverse: reverse,
          autoPlayAnimationDuration: const Duration(seconds: 6),
          enableInfiniteScroll: true,
          autoPlayInterval: const Duration(seconds: 3),
        ),
        items: indexes.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppRadius.sm),
                      child: Assets.images.png.values
                          .elementAt(i)
                          .image(height: slot, fit: BoxFit.cover),
                    ),
                    10.vSpace,
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppRadius.sm),
                      child: Assets.images.png.values
                          .elementAt(i)
                          .image(height: slot, fit: BoxFit.cover),
                    ),
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
