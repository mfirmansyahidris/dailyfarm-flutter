import 'package:dailyfarm/models/layer_data.dart';
import 'package:dailyfarm/resources/images.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StageBloc extends Cubit<LayerData<int>> {

  StageBloc()
      : super(LayerData<int>(
      state: 1,
      asset: Images.farm.growthStages.stages(1),
      bottom: 130,
      left: 120,
  ));

  void setStage(int stage) {
    emit(
        LayerData<int>(
          state: stage,
          asset: Images.farm.growthStages.stages(stage),
          bottom: 130,
          left: 120,
        )
    );
  }
}
