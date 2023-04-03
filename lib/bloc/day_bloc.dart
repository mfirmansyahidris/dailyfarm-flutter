import 'package:dailyfarm/models/layer_data.dart';
import 'package:dailyfarm/resources/images.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum DayEvent { day, night }

class DayBloc extends Cubit<LayerData<DayEvent>> {

  DayBloc()
      : super(LayerData<DayEvent>(
      state: DayEvent.day,
      asset: Images.background.bright
  ));

  void setDay(DayEvent event) {
    switch (event) {
      case DayEvent.day:
        emit(LayerData<DayEvent>(
          state: DayEvent.day,
          asset: Images.background.bright,
          height: 100,
          width: 100
        ));
        break;
      case DayEvent.night:
        emit(LayerData<DayEvent>(
          state: DayEvent.night,
          asset: Images.background.dark,
          height: 100,
          width: 100
        ));
        break;
    }
  }
}
