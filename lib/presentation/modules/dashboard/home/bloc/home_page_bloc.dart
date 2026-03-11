import 'package:ateam_software_test/data/models/experience.dart';
import 'package:ateam_software_test/data/models/living_style.dart';
import 'package:ateam_software_test/data/models/trip.dart';
import 'package:ateam_software_test/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../interactor/home_interactor.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

@injectable
class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final HomeInteractor _interactor = injector.get();

  HomePageBloc() : super(HomePageInitial());
}
