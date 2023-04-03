// ignore_for_file: library_private_types_in_public_api

class Images {
  Images._();

  static _Background background = _Background();
  static _Farm farm = _Farm();
  static _Farmer farmer = _Farmer();
  static _WeatherOverlay weatherOverlay = _WeatherOverlay();
}

class _Background {
  String bright = "assets/background/bright.png";
  String dark = "assets/background/dark.png";
}

class _Farm {
  String base = "assets/farm/base.png";
  _FarmOverlay farmOverlay = _FarmOverlay();
  _GrowthStages growthStages = _GrowthStages();
}

class _FarmOverlay{
  String flood = "assets/farm/farm_overlay/flood.png";
  String prepped = "assets/farm/farm_overlay/prepped.png";
}

class _GrowthStages{
  String stages(int stage){
    if(stage > 0 && stage <= 10){
      return "assets/farm/growth_stages/stage_$stage.png";
    }
    return "assets/farm/growth_stages/stage_1.png";
  }
}

class _Farmer{
  String angry = "assets/farmer/angry.gif";
  String happy = "assets/farmer/happy.gif";
  String neutral = "assets/farmer/neutral.gif";
}

class _WeatherOverlay{
  String nightClouds = "assets/weather_overlay/night_clouds.gif";
  String rainy = "assets/weather_overlay/rainy.gif";
  String sunny = "assets/weather_overlay/sunny.gif";
}