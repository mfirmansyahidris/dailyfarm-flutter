import 'package:dailyfarm/bloc/farm_bloc.dart';
import 'package:dailyfarm/bloc/farmer_bloc.dart';
import 'package:dailyfarm/bloc/stage_bloc.dart';
import 'package:dailyfarm/pages/drawer_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/day_bloc.dart';
import '../bloc/weather_bloc.dart';
import '../models/layer_data.dart';
import '../resources/images.dart';
import '../utils/context.dart';

class FarmFieldPage extends StatefulWidget {
  const FarmFieldPage({Key? key}) : super(key: key);

  @override
  State<FarmFieldPage> createState() => _FarmFieldPageState();
}

class _FarmFieldPageState extends State<FarmFieldPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<DayBloc, LayerData>(
            builder: (context, state) => Image.asset(
              state.asset,
              width: context.widthInPercent(state.width ?? 100),
              height: context.heightInPercent(state.height ?? 100),
              fit: BoxFit.fill,
            ),
          ),
          _buildFiled(),
          const DrawerSettings()
        ],
      ),
    );
  }

  Widget _buildFiled(){
    return Container(
      padding: EdgeInsets.all(20.w),
      height: context.widthInPercent(100),
      width: context.widthInPercent(100),
      child: FittedBox(
        child: Stack(
          children: [
            BlocBuilder<WeatherBloc, bool>(
              builder: (context, rainy){
                if(rainy) {
                  return const SizedBox();
                }

                return BlocBuilder<DayBloc, LayerData<DayEvent>>(
                  builder: (context, day){
                    if(day.state == DayEvent.day){
                      return Image.asset(
                        Images.weatherOverlay.sunny,
                      );
                    }
                    return Image.asset(
                      Images.weatherOverlay.nightClouds,
                    );
                  },
                );
              },
            ),
            Image.asset(
              Images.farm.base,
            ),
            BlocBuilder<FarmBloc, LayerData<FarmEvent>>(
              builder: (context, state) => Positioned(
                bottom: state.bottom,
                left: state.left,
                child: Image.asset(state.asset,),
              ),
            ),
            BlocBuilder<FarmerBloc, LayerData<FarmerEvent>>(
              builder: (context, state) => Positioned(
                right: state.right,
                bottom: state.bottom,
                child: Image.asset(state.asset),
              ),
            ),
            BlocBuilder<StageBloc, LayerData<int>>(
              builder: (context, state) => Positioned(
                bottom: state.bottom,
                left: state.left,
                child: Image.asset(state.asset),
              )
            ),
            BlocBuilder<WeatherBloc, bool>(
              builder: (context, rainy){
                if(rainy) {
                  return Image.asset(
                    Images.weatherOverlay.rainy,
                  );
                }

                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
