import '../data/weather_model.dart';

abstract class WeatherView {
  void onWeatherData(List<Weather> weathers);
  void onError(String message);
}
