part of 'dashboard_cubit.dart';

abstract class DashboardState {
  final int index;

  String get route;

  DashboardState(this.index);
}

class DashboardHome extends DashboardState {
  DashboardHome() : super(DashboardPage.home.index);

  @override
  String get route => 'home';
}

class DashboardExplore extends DashboardState {
  DashboardExplore() : super(DashboardPage.explore.index);

  @override
  String get route => 'explore';
}

class DashboardChat extends DashboardState {
  DashboardChat() : super(DashboardPage.chat.index);

  @override
  String get route => 'chat';
}

class DashboardSaved extends DashboardState {
  DashboardSaved() : super(DashboardPage.saved.index);

  @override
  String get route => 'saved';
}

class DashboardProfile extends DashboardState {
  DashboardProfile() : super(DashboardPage.profile.index);

  @override
  String get route => 'profile';
}
