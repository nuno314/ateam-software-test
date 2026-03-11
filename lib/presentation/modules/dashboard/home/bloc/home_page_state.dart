part of 'home_page_bloc.dart';

class _ViewModel {
  final List<Trip> trips;
  final List<LivingStyle> livingStyles;
  final List<Experience> experiences;

  const _ViewModel({
    this.trips = const [],
    this.livingStyles = const [],
    this.experiences = const [],
  });

  _ViewModel copyWith({
    List<Trip>? trips,
    List<LivingStyle>? livingStyles,
    List<Experience>? experiences,
    
  }) {
    return _ViewModel(
      trips: trips ?? this.trips,
      livingStyles: livingStyles ?? this.livingStyles,
      experiences: experiences ?? this.experiences,
    );
  }
}

abstract class HomePageState {
  final _ViewModel viewModel;

  HomePageState(this.viewModel);

  T copyWith<T extends HomePageState>({_ViewModel? viewModel}) {
    return _factories[T == HomePageState ? runtimeType : T]!(
      viewModel ?? this.viewModel,
    );
  }

  List<Trip> get trips => viewModel.trips;
  List<LivingStyle> get livingStyles => viewModel.livingStyles;
  List<Experience> get experiences => viewModel.experiences;
}

class HomePageInitial extends HomePageState {
  HomePageInitial({_ViewModel viewModel = const _ViewModel()}) : super(viewModel);
}

class HomePageLoading extends HomePageState {
  HomePageLoading({required _ViewModel viewModel}) : super(viewModel);
}

final _factories = <Type, Function(_ViewModel viewModel)>{
  HomePageInitial: (viewModel) => HomePageInitial(viewModel: viewModel),
  HomePageLoading: (viewModel) => HomePageLoading(viewModel: viewModel),
};
