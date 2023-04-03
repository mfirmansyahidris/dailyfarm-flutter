import 'package:dailyfarm/models/layer_data.dart';
import 'package:dailyfarm/resources/images.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum FarmEvent { flood, prepped }

class FarmBloc extends Cubit<LayerData<FarmEvent>> {

  FarmBloc()
      : super(LayerData<FarmEvent>(
      state: FarmEvent.prepped,
      asset: Images.farm.farmOverlay.prepped,
      bottom: 110,
      left: 60,

  ));

  void setFarm(FarmEvent event) {
    switch (event) {
      case FarmEvent.flood:
        emit(LayerData<FarmEvent>(
            state: FarmEvent.flood,
            asset: Images.farm.farmOverlay.flood,
            bottom: 90,
            left: 0,
        ));
        break;
      case FarmEvent.prepped:
        emit(LayerData<FarmEvent>(
            state: FarmEvent.prepped,
            asset: Images.farm.farmOverlay.prepped,
            bottom: 110,
            left: 60,
        ));
        break;
    }
  }
}
