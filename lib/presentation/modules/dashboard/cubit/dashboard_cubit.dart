import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';

part 'dashboard_state.dart';

enum DashboardPage { home, explore, chat, saved, profile }

@singleton
class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardHome());

  void navigateTo(int idx) {
    if (idx == DashboardPage.home.index) {
      emit(DashboardHome());
    } else if (idx == DashboardPage.explore.index) {
      emit(DashboardExplore());
    } else if (idx == DashboardPage.chat.index) {
      emit(DashboardChat());
    } else if (idx == DashboardPage.saved.index) {
      emit(DashboardSaved());
    } else if (idx == DashboardPage.profile.index) {
      emit(DashboardProfile());
    } else {
      assert(false, 'Page with idx $idx not found!');
    }
  }

  List<DashboardState> get dashboardStates => [
    DashboardHome(),
    DashboardExplore(),
    DashboardChat(),
    DashboardSaved(),
    DashboardProfile(),
  ];

  int navigateByRoute(String route) {
    final state = dashboardStates.firstWhereOrNull((e) => e.route == route);
    if (state == null) {
      return -1;
    }
    navigateTo(state.index);
    return 1;
  }
}
