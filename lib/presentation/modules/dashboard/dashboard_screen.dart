import 'dart:async';

import 'package:ateam_software_test/di/di.dart';
import 'package:ateam_software_test/gen/assets.gen.dart';
import 'package:ateam_software_test/presentation/widgets/custom_navigation_bar.dart';
import 'package:ateam_software_test/presentation/widgets/keep_alive_widge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'chat/bloc/chat_bloc.dart';
import 'chat/chat_interactor.dart';
import 'chat/chat_screen.dart';
import 'cubit/dashboard_cubit.dart';
import 'explore/bloc/explore_bloc.dart';
import 'explore/explore_screen.dart';
import 'home/bloc/home_page_bloc.dart';
// dashboard submodules
import 'home/home_page_screen.dart';
import 'profile/bloc/profile_bloc.dart';
import 'profile/profile_interactor.dart';
import 'profile/profile_screen.dart';
import 'saved/bloc/saved_bloc.dart';
import 'saved/saved_interactor.dart';
import 'saved/saved_screen.dart';

class DashboardScreen extends StatefulWidget {
  static const String path = '/dashboard';
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DashboardCubit get _cubit => BlocProvider.of(context);

  final _pageController = PageController();

  StreamSubscription? connectivitySub;

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cubit.navigateTo(DashboardPage.home.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.transparent,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: [
                KeepAliveWidget(
                  child: BlocProvider<HomePageBloc>(
                    create: (context) => injector.get(),
                    child: const HomePageScreen(),
                  ),
                ),
                BlocProvider<ExploreBloc>(
                  create: (context) => injector.get(),
                  child: const ExploreScreen(),
                ),
                KeepAliveWidget(
                  child: BlocProvider(
                    create: (context) => ChatBloc(ChatInteractor()),
                    child: const ChatScreen(),
                  ),
                ),
                KeepAliveWidget(
                  child: BlocProvider(
                    create: (context) => SavedBloc(SavedInteractor()),
                    child: const SavedScreen(),
                  ),
                ),
                KeepAliveWidget(
                  child: BlocProvider(
                    create: (context) => ProfileBloc(ProfileInteractor()),
                    child: const ProfileScreen(),
                  ),
                ),
              ],
            ),
            BlocConsumer<DashboardCubit, DashboardState>(
              listener: _cubitListener,
              bloc: _cubit,
              builder: (context, state) => CustomBottomNavigationBar(
                items: [
                  BottomBarItemData(
                    icon: _buildBottomBarIcon(
                      asset: Assets.images.svg.icHome.path,
                    ),
                    selectedIcon: _buildBottomBarIcon(
                      asset: Assets.images.svg.icHomeFilled.path,
                    ),
                    title: 'Home',
                  ),
                  BottomBarItemData(
                    icon: _buildBottomBarIcon(
                      asset: Assets.images.svg.icExplore.path,
                    ),
                    selectedIcon: _buildBottomBarIcon(
                      asset: Assets.images.svg.icExploreFilled.path,
                    ),
                    title: 'Explore',
                  ),
                  BottomBarItemData(
                    icon: _buildBottomBarIcon(
                      asset: Assets.images.svg.icChat.path,
                    ),
                    selectedIcon: _buildBottomBarIcon(
                      asset: Assets.images.svg.icChatFilled.path,
                    ),
                    title: 'Chat',
                  ),
                  BottomBarItemData(
                    icon: _buildBottomBarIcon(
                      asset: Assets.images.svg.icSave.path,
                    ),
                    selectedIcon: _buildBottomBarIcon(
                      asset: Assets.images.svg.icSaveFilled.path,
                    ),
                    title: 'Saved',
                  ),
                  BottomBarItemData(
                    icon: _buildBottomBarIcon(
                      asset: Assets.images.svg.icProfile.path,
                    ),
                    selectedIcon: _buildBottomBarIcon(
                      asset: Assets.images.svg.icProfileFilled.path,
                    ),
                    title: 'Profile',
                  ),
                ],
                selectedIdx: state.index,
                onItemSelection: onNavigationPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBarIcon({required String asset, void Function()? ontap}) {
    return InkWell(
      onTap: ontap,
      child: Container(child: SvgPicture.asset(asset, width: 24, height: 24)),
    );
  }

  Future<bool> onNavigationPressed(int idx) async {
    _cubit.navigateTo(idx);
    return true;
  }

  void _cubitListener(BuildContext context, DashboardState state) {
    // when the cubit index changes we tell the page controller to switch pages
    _pageController.jumpToPage(state.index);
  }
}
