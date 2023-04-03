import 'package:dailyfarm/bloc/farm_bloc.dart';
import 'package:dailyfarm/bloc/farmer_bloc.dart';
import 'package:dailyfarm/bloc/stage_bloc.dart';
import 'package:dailyfarm/utils/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/day_bloc.dart';
import '../bloc/weather_bloc.dart';
import '../models/layer_data.dart';
import '../models/setting_item.dart';

class DrawerSettings extends StatelessWidget {
  const DrawerSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double initialChildSize = ((20.w * 2) + 18.sp) / context.heightInPercent(100);
    return DraggableScrollableSheet(
      minChildSize: initialChildSize,
      maxChildSize: 0.5,
      initialChildSize: initialChildSize,
      snap: true,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.w),
                topRight: Radius.circular(30.w),
              ),
              color: Colors.white
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Text(
                    "Set The Farmer's mood",
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ),
                const Divider(),
                Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    children: [
                      _settingsItem(
                          label: "Time of Day",
                          children: [
                            BlocBuilder<DayBloc, LayerData<DayEvent>>(
                              builder: (context, state) => _settingItemChild(SettingItem(
                                  icon: Icons.sunny,
                                  label: "Day",
                                  isSelected: state.state == DayEvent.day,
                                  onClick: (){
                                    context.read<DayBloc>().setDay(DayEvent.day);
                                  }
                              )),
                            ),
                            BlocBuilder<DayBloc, LayerData<DayEvent>>(
                              builder: (context, state) => _settingItemChild(SettingItem(
                                  icon: Icons.nightlight_round,
                                  label: "Night",
                                  isSelected: state.state == DayEvent.night,
                                  onClick: (){
                                    context.read<DayBloc>().setDay(DayEvent.night);
                                  }
                              )),
                            ),
                          ]
                      ),
                      SizedBox(height: 20.w,),
                      _settingsItem(
                          label: "Weather",
                          children: [
                            BlocBuilder<WeatherBloc, bool>(
                              builder: (context, state) => _settingItemChild(SettingItem(
                                  icon: Icons.cloudy_snowing,
                                  label: "Rain",
                                  isSelected: state,
                                  onClick: (){
                                    context.read<WeatherBloc>().setRainy(true);
                                  }
                              )),
                            ),
                            BlocBuilder<WeatherBloc, bool>(
                              builder: (context, state) => _settingItemChild(SettingItem(
                                  icon: Icons.sunny,
                                  label: "Sunny",
                                  isSelected: !state,
                                  onClick: (){
                                    context.read<WeatherBloc>().setRainy(false);
                                  }
                              )),
                            ),
                          ]
                      ),
                      SizedBox(height: 20.w,),
                      _settingsItem(
                          label: "Farm",
                          children: [
                            BlocBuilder<FarmBloc, LayerData<FarmEvent>>(
                              builder: (context, state) => _settingItemChild(SettingItem(
                                  label: "Flood",
                                  isSelected: state.state == FarmEvent.flood,
                                  onClick: (){
                                    context.read<FarmBloc>().setFarm(FarmEvent.flood);
                                  }
                              )),
                            ),
                            BlocBuilder<FarmBloc, LayerData<FarmEvent>>(
                              builder: (context, state) => _settingItemChild(SettingItem(
                                  label: "Prepped",
                                  isSelected: state.state == FarmEvent.prepped,
                                  onClick: (){
                                    context.read<FarmBloc>().setFarm(FarmEvent.prepped);
                                  }
                              )),
                            ),
                          ]
                      ),
                      SizedBox(height: 20.w,),
                      BlocBuilder<StageBloc, LayerData<int>>(
                        builder: (context, stage){
                          String s = stage.state.toString();
                          if(stage.state == 10){
                            s = "Harvest";
                          }
                          return _settingsItem(
                              label: "Stage",
                              children: [
                                Slider(
                                  value: double.tryParse(stage.state.toString()) ?? 1,
                                  onChanged: (value){
                                    context.read<StageBloc>().setStage(value.toInt());
                                  },
                                  min: 1,
                                  max: 10,
                                ),
                                Text(
                                  s,
                                  style: TextStyle(
                                    fontSize: 12.w
                                  ),
                                )
                              ]
                          );
                        },
                      ),
                      SizedBox(height: 20.w,),
                      _settingsItem(
                          label: "Farmer",
                          children: [
                            BlocBuilder<FarmerBloc, LayerData<FarmerEvent>>(
                              builder: (context, state) => _settingItemChild(SettingItem(
                                  label: "Angry",
                                  isSelected: state.state == FarmerEvent.angry,
                                  onClick: (){
                                    context.read<FarmerBloc>().setEmotion(FarmerEvent.angry);
                                  }
                              )),
                            ),
                            BlocBuilder<FarmerBloc, LayerData<FarmerEvent>>(
                              builder: (context, state) => _settingItemChild(SettingItem(
                                  label: "Neutral",
                                  isSelected: state.state == FarmerEvent.neutral,
                                  onClick: (){
                                    context.read<FarmerBloc>().setEmotion(FarmerEvent.neutral);
                                  }
                              )),
                            ),
                            BlocBuilder<FarmerBloc, LayerData<FarmerEvent>>(
                              builder: (context, state) => _settingItemChild(SettingItem(
                                  label: "Happy",
                                  isSelected: state.state == FarmerEvent.happy,
                                  onClick: (){
                                    context.read<FarmerBloc>().setEmotion(FarmerEvent.happy);
                                  }
                              )),
                            ),
                          ]
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }


  Widget _settingsItem({required String label, List<Widget>? children}){
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(fontSize: 14.sp),
          ),
        ),
        SizedBox(height: 20.w,),
        Wrap(
          spacing: 10.w,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: children ?? [],
        )
      ],
    );
  }

  Widget _settingItemChild(SettingItem settingItem){
    if(settingItem.icon == null){
      return ElevatedButton(
        style: !settingItem.isSelected ? ElevatedButton.styleFrom(
            backgroundColor: Colors.grey
        ) : null,
        onPressed: settingItem.onClick,
        child: Text(settingItem.label),
      );
    }

    return ElevatedButton.icon(
        onPressed: settingItem.onClick,
        icon: Icon(
            settingItem.icon
        ),
        style: !settingItem.isSelected ? ElevatedButton.styleFrom(
            backgroundColor: Colors.grey
        ) : null,
        label: Text(settingItem.label)
    );
  }
}
