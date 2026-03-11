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
    return Container(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.md,
        MediaQuery.of(context).padding.top + AppSpacing.md,
        AppSpacing.md,
        MediaQuery.of(context).padding.bottom + AppSpacing.md,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Row(
                  children: [
                    _buildCasourelWidget(),
                    // _buildCasourelWidget(indexes: [2, 1, 3, 0], reverse: true),
                    // _buildCasourelWidget(indexes: [2, 1, 3, 0]),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  height: (508.h - MediaQuery.of(context).padding.top) / 3,
                  child: Container(
                    height: 508.h - MediaQuery.of(context).padding.top,
                    width: 400.w,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          ThemeColor.white.withOpacity(0.1),
                          ThemeColor.white,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
              ],
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

  Widget _buildCasourelWidget({
    List<int> indexes = const [0, 1, 2, 3],
    bool reverse = false,
  }) {
    return Expanded(
      child: CarouselSlider(
        disableGesture: true,
        options: CarouselOptions(
          height: 508.h - MediaQuery.of(context).padding.top,
          autoPlay: true,
          scrollDirection: Axis.vertical,
          reverse: reverse,
          autoPlayAnimationDuration: Duration(seconds: 6),
          enableInfiniteScroll: true,
          autoPlayInterval: Duration(seconds: 3),
        ),
        items: indexes.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppRadius.sm),
                      child: Assets.images.png.values
                          .elementAt(i)
                          .image(height: 200, fit: BoxFit.fitHeight),
                    ),
                    10.vSpace,
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppRadius.sm),
                      child: Assets.images.png.values
                          .elementAt(i)
                          .image(height: 200, fit: BoxFit.fitHeight),
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
