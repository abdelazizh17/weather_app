import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_ui_setup/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:news_app_ui_setup/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:news_app_ui_setup/views/search_view.dart';
import 'package:news_app_ui_setup/widgets/no_weather_body.dart';
import 'package:news_app_ui_setup/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<WeatherCubit,WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSuccessState) {
            return WeatherInfoBody(weather: state.weatherModel);
          } else {
            return const Center(
              child: Text('Something went wrong, please try again'),
            );
          }
        },
      ),
    );
  }
}
