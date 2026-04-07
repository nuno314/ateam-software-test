import 'package:ateam_software_test/common/constants/app_text_style.dart';
import 'package:ateam_software_test/gen/assets.gen.dart';
import 'package:ateam_software_test/presentation/extensions/space_extension.dart';
import 'package:ateam_software_test/presentation/modules/auth/bloc/auth_bloc.dart';
import 'package:ateam_software_test/presentation/modules/dashboard/dashboard_screen.dart';
import 'package:ateam_software_test/presentation/theme/theme_color.dart';
import 'package:ateam_software_test/presentation/widgets/app_button.dart';
import 'package:ateam_software_test/presentation/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  static const path = 'login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthBloc get bloc => BlocProvider.of(context);
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ThemeColor.white,
          appBar: AppBar(backgroundColor: ThemeColor.white),
          body: Padding(
            padding: EdgeInsets.all(16.r),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Welcome back', style: AppTextStyle.textBold24px),
                  8.vSpace,
                  Text(
                    'Log In to your Placoo account to explore your dream place to live across the whole world!',
                    style: AppTextStyle.textRegular24px,
                  ),
                  40.vSpace,
                  AppTextField(
                    controller: usernameController,
                    prefixIcon: Assets.images.svg.icPerson.svg(
                      width: 22.r,
                      height: 22.r,
                    ),
                    title: 'Username',
                  ),
                  18.vSpace,
                  AppTextField(
                    controller: passwordController,
                    prefixIcon: Assets.images.svg.icKey.svg(
                      width: 22.r,
                      height: 22.r,
                    ),
                    title: 'Password',
                    isPassword: true,
                  ),
                  28.vSpace,
                  AppButton.primary(
                    onTap: () {
                      bloc.add(
                        SignInEvent(
                          username: usernameController.text,
                          password: passwordController.text,
                        ),
                      );
                    },
                    loading: state is LoadingAuthState,
                    child: Text('Login', style: AppTextStyle.textMedium24px),
                  ),
                  12.vSpace,
                  Text('Forgot password?'),
                  42.vSpace,
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1.h,
                          color: ThemeColor.colorEBE8F6,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        decoration: BoxDecoration(
                          color: ThemeColor.colorF3F0FF,
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: Text(
                          'OR',
                          style: AppTextStyle.caption.copyWith(
                            color: ThemeColor.color9E91DA,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1.h,
                          color: ThemeColor.colorEBE8F6,
                        ),
                      ),
                    ],
                  ),
                  42.vSpace,
                  AppButton(
                    onTap: () {},
                    height: 50.h,
                    color: ThemeColor.color222831,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        children: [
                          Assets.images.svg.icApple.svg(
                            width: 22.r,
                            height: 22.r,
                          ),
                          Expanded(
                            child: Text(
                              'Login with Apple',
                              style: AppTextStyle.textMedium24px,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          22.hSpace,
                        ],
                      ),
                    ),
                  ),
                  12.vSpace,
                  AppButton(
                    onTap: () {},
                    height: 50.h,
                    color: ThemeColor.white,
                    borderColor: ThemeColor.color222831,
                    borderRadius: BorderRadius.circular(24.r),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        children: [
                          Assets.images.svg.icGoogle.svg(
                            width: 22.r,
                            height: 22.r,
                          ),

                          Expanded(
                            child: Text(
                              'Login with Google',
                              style: AppTextStyle.textMedium24px.copyWith(
                                color: ThemeColor.color222831,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          22.hSpace,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      listener: _blocListener,
    );
  }

  void _blocListener(BuildContext context, AuthState state) {
    if (state is LoginSuccessfullyState) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        DashboardScreen.path,
        (_) => false,
      );
    }
  }
}
