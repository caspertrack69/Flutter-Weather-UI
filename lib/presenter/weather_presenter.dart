import '../data/weather_model.dart';
import '../data/weather_repository.dart';

abstract class WeatherView {
  void onWeatherData(List<Weather> weathers);
  void onError(String message);
}

class WeatherPresenter {
  final WeatherView view;
  final WeatherRepository repository;

  WeatherPresenter(this.view, this.repository);

  void loadWeather() async {
    try {
      var weathers = await repository.fetchWeather();
      view.onWeatherData(weathers);
    } catch (e) {
      view.onError("Terjadi kesalahan saat memuat data cuaca.");
    }
  }
}
