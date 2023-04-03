import 'package:dailyfarm/models/layer_data.dart';
import 'package:dailyfarm/resources/images.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum FarmerEvent { angry, happy, neutral }

class FarmerBloc extends Cubit<LayerData<FarmerEvent>> {

  FarmerBloc()
      : super(LayerData<FarmerEvent>(
      state: FarmerEvent.neutral,
      asset: Images.farmer.neutral,
      right: 0,
      bottom: 370,
  ));

  void setEmotion(FarmerEvent event) {
    switch (event) {
      case FarmerEvent.neutral:
        emit(LayerData<FarmerEvent>(
          state: FarmerEvent.neutral,
          asset: Images.farmer.neutral,
          right: 0,
          bottom: 370,
        ));
        break;
      case FarmerEvent.happy:
        emit(LayerData<FarmerEvent>(
          state: FarmerEvent.happy,
          asset: Images.farmer.happy,
          right: 0,
          bottom: 370,
        ));
        break;
      case FarmerEvent.angry:
        emit(LayerData<FarmerEvent>(
          state: FarmerEvent.angry,
          asset: Images.farmer.angry,
          right: 0,
          bottom: 370,
        ));
        break;
    }
  }
}
