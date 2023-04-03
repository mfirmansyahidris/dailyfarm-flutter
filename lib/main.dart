import 'dart:async';

import 'package:dailyfarm/bloc/farm_bloc.dart';
import 'package:dailyfarm/bloc/farmer_bloc.dart';
import 'package:dailyfarm/bloc/stage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/day_bloc.dart';
import 'bloc/weather_bloc.dart';
import 'pages/farm_filed_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded(
    () => SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]).then((_) async {
      runApp(const MyApp());
    }),
    (error, stackTrace) async {
      debugPrint(error.toString());
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      builder: (context, _) {
        return MaterialApp(
          title: 'Daily Farm',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => DayBloc()),
              BlocProvider(create: (context) => FarmBloc()),
              BlocProvider(create: (context) => FarmerBloc()),
              BlocProvider(create: (context) => StageBloc()),
              BlocProvider(create: (context) => WeatherBloc()),
            ],
            child: const FarmFieldPage(),
          ),
        );
      },
    );
  }
}
