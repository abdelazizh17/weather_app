import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_ui_setup/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:news_app_ui_setup/models/weather_model.dart';
import 'package:news_app_ui_setup/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitialState());

  WeatherService weatherService;
  WeatherModel? weatherModel;
  void getWeather({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      weatherModel = await weatherService.getCurrentWeather(cityName: cityName);
      emit(WeatherSuccessState(weatherModel!));
    } catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }
}
