import 'package:ateam_software_test/common/constants/app_text_style.dart';
import 'package:ateam_software_test/gen/assets.gen.dart';
import 'package:ateam_software_test/presentation/extensions/space_extension.dart';
import 'package:ateam_software_test/presentation/theme/theme_color.dart';
import 'package:ateam_software_test/presentation/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/profile_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileBloc get bloc => BlocProvider.of(context);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ThemeColor.scaffold,
          body: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 24),
                ClipRRect(
                  borderRadius: BorderRadius.circular(40.w),
                  child: CachedNetworkImageWrapper.avatar(
                    url: 'https://randomuser.me/api/portraits/women/20.jpg',
                    size: 80.w,
                  ),
                ),
                const SizedBox(height: 12),
                Text('Lucy Bond', style: AppTextStyle.textSemibold24px),
                4.vSpace,
                Text(
                  'lucybond08@gmail.com',
                  style: AppTextStyle.textRegular16px,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Divider(
                    height: 80.h,
                    thickness: 0.6.h,
                    color: ThemeColor.colorD6D6D6,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      _ProfileMenuTile(
                        option: ProfileMenuOption.personalDetails,
                      ),
                      _ProfileMenuTile(option: ProfileMenuOption.settings),
                      _ProfileMenuTile(
                        option: ProfileMenuOption.paymentDetails,
                      ),
                      _ProfileMenuTile(option: ProfileMenuOption.faq),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Divider(
                          height: 56.h,
                          thickness: 0.6.h,
                          color: ThemeColor.colorD6D6D6,
                        ),
                      ),
                      _ProfileMenuTile(
                        option: ProfileMenuOption.switchToHosting,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

enum ProfileMenuOption {
  personalDetails,
  settings,
  paymentDetails,
  faq,
  switchToHosting,
}

class _ProfileMenuTile extends StatelessWidget {
  final ProfileMenuOption option;

  const _ProfileMenuTile({required this.option});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _buildIcon(),
      title: Text(_title(), style: AppTextStyle.textMedium16px),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }

  String _title() {
    switch (option) {
      case ProfileMenuOption.personalDetails:
        return 'Personal details';
      case ProfileMenuOption.settings:
        return 'Settings';
      case ProfileMenuOption.paymentDetails:
        return 'Payment details';
      case ProfileMenuOption.faq:
        return 'FAQ';
      case ProfileMenuOption.switchToHosting:
        return 'Switch to hosting';
    }
  }

  Widget _buildIcon() {
    Widget iconWidget;
    switch (option) {
      case ProfileMenuOption.personalDetails:
        iconWidget = Assets.images.svg.icPersonal.svg();
        break;
      case ProfileMenuOption.settings:
        iconWidget = Assets.images.svg.icSettings.svg();
        break;
      case ProfileMenuOption.paymentDetails:
        iconWidget = Assets.images.svg.icWallet.svg();
        break;
      case ProfileMenuOption.faq:
        iconWidget = Assets.images.svg.icFaq.svg();
        break;
      case ProfileMenuOption.switchToHosting:
        iconWidget = Assets.images.svg.icSwitch.svg();
        break;
    }

    return Container(
      width: 40.w,
      height: 40.w,
      decoration: BoxDecoration(
        color: ThemeColor.colorFDFDFD,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ThemeColor.colorE3E3E7, width: 0.5),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 16,
            spreadRadius: 0,
            color: const Color(0x26454545),
          ),
        ],
      ),
      child: Center(child: iconWidget),
    );
  }
}
