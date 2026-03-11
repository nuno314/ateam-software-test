import 'package:ateam_software_test/common/constants/app_text_style.dart';
import 'package:ateam_software_test/gen/assets.gen.dart';
import 'package:ateam_software_test/presentation/extensions/space_extension.dart';
import 'package:ateam_software_test/presentation/theme/theme_color.dart';
import 'package:ateam_software_test/presentation/widgets/app_text_field.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/explore_bloc.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  ExploreBloc get bloc => BlocProvider.of(context);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExploreBloc, ExploreState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ThemeColor.scaffold,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.r),
                    child: GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Navigate to search')),
                        );
                      },
                      child: AppTextField(
                        prefixIcon: Assets.images.svg.icSearch.svg(),
                        readOnly: true,
                        hintText: 'Search articles, city, location',
                      ),
                    ),
                  ),

                  if (state is ExploreLoaded) ...[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Find your next trip',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'See all',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: ThemeColor.color9E91DA,
                            ),
                          ),
                        ],
                      ),
                    ),
                    4.vSpace,
                    SizedBox(
                      height: 240.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        itemCount: state.trips.length,
                        itemBuilder: (context, index) {
                          final trip = state.trips[index];
                          if (trip.name == null || trip.image == null) {
                            return SizedBox.shrink();
                          }
                          return Padding(
                            padding: EdgeInsets.only(right: 12.w),
                            child: _buildCard(
                              title: trip.name!,
                              imageUrl: trip.image!,
                              subtitle: '${trip.rentedPropsCount} properties',
                            ),
                          );
                        },
                      ),
                    ),
                    16.vSpace,

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        'Explore by living style',
                        style: AppTextStyle.textSemibold18px,
                      ),
                    ),
                    4.vSpace,
                    SizedBox(
                      height: 211.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        itemCount: state.livingStyles.length,
                        itemBuilder: (context, index) {
                          final style = state.livingStyles[index];
                          if (style.name == null || style.image == null) {
                            return SizedBox.shrink();
                          }
                          return Padding(
                            padding: EdgeInsets.only(right: 12.w),
                            child: _buildCard(
                              title: style.name!,
                              imageUrl: style.image!,
                            ),
                          );
                        },
                      ),
                    ),
                    16.vSpace,

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        'Want to discover other experiences',
                        style: AppTextStyle.textSemibold18px,
                      ),
                    ),
                    8.vSpace,
                    SizedBox(
                      height: 211.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        itemCount: state.experiences.length,
                        itemBuilder: (context, index) {
                          final experience = state.experiences[index];
                          if (experience.name == null ||
                              experience.image == null) {
                            return SizedBox.shrink();
                          }
                          return Padding(
                            padding: EdgeInsets.only(right: 12.w),
                            child: _buildCard(
                              title: experience.name!,
                              imageUrl: experience.image!,
                            ),
                          );
                        },
                      ),
                    ),
                    16.vSpace,
                  ] else if (state is ExploreLoading) ...[
                    Center(child: CircularProgressIndicator()),
                  ] else if (state is ExploreError) ...[
                    Center(child: Text('Error: ${state.message}')),
                  ],
                  120.vSpace,
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCard({
    required String title,
    required String imageUrl,
    String? subtitle,
  }) {
    return Container(
      width: 182.w,
      margin: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 24),
            blurRadius: 96,
            spreadRadius: 0,
            color: const Color(0x26434343),
          ),
        ],
        color: ThemeColor.colorFDFDFD,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => Container(
                  width: 0,
                  height: 0,
                  color: Colors.grey[300],
                  child: Icon(Icons.broken_image, size: 20.sp),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.textMedium16px.copyWith(
                    color: ThemeColor.color1a1e25,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.left,
                ),
                if (subtitle != null) ...[
                  4.vSpace,
                  Text(
                    subtitle,
                    style: AppTextStyle.textRegular13px,
                    textAlign: TextAlign.left,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
