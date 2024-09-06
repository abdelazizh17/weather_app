import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_ui_setup/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:news_app_ui_setup/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:news_app_ui_setup/views/home_view.dart';

void main() {
  runApp(
    const NewsApp(),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                useMaterial3: false,
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition,
                ),
              ),
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.amber;

    case 'Partly cloudy':
    case 'Cloudy':
      return Colors.blueGrey;

    case 'Overcast':
      return Colors.grey;

    case 'Mist':
    case 'Fog':
      return Colors.blueGrey;

    case 'Patchy rain possible':
    case 'Light drizzle':
    case 'Patchy light drizzle':
    case 'Light rain':
    case 'Patchy light rain':
      return Colors.lightBlue;

    case 'Moderate rain':
    case 'Heavy rain':
    case 'Heavy rain at times':
    case 'Torrential rain shower':
    case 'Moderate or heavy rain shower':
      return Colors.blue;

    case 'Patchy snow possible':
    case 'Patchy rain nearby':
    case 'Light snow':
    case 'Patchy light snow':
    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Patchy heavy snow':
    case 'Heavy snow':
      return Colors.lightBlue;

    case 'Patchy sleet possible':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
    case 'Blowing snow':
    case 'Blizzard':
      return Colors.blueGrey;

    case 'Patchy freezing drizzle possible':
    case 'Freezing drizzle':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
      return Colors.cyan;

    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
      return Colors.deepPurple;

    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.indigo;

    case 'Ice pellets':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.cyan;

    default:
      return Colors.grey; // Default color for unspecified conditions
  }
}
