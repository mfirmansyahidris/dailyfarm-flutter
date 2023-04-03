import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherBloc extends Cubit<bool> {

  WeatherBloc() : super(false);

  void setRainy(bool rain) {
    emit(rain);
  }
}
