import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_project/core/components/default_appbar.dart';
import 'package:weather_project/core/components/default_scaffold.dart';
import 'package:weather_project/core/extensions/custom_string_extension.dart';
import 'package:weather_project/core/models/day_model.dart';
import 'package:weather_project/src/features/home/presenter/controllers/wather_week_controller.dart';
import 'package:weather_project/src/features/home/presenter/controllers/weather_day_controller.dart';
import 'package:weather_project/src/features/home/presenter/pages/weather_day_page.dart';

import '../utils/functions.dart';

class WeatherWeekPage extends StatelessWidget {
  const WeatherWeekPage({super.key});
  @override
  Widget build(BuildContext context) {
    WeatherWeekController weatherWeekController =
        context.read<WeatherWeekController>();
    return DefaultScaffold(
      appBar: const DefaultAppBar(title: '7 dias'),
      body: Column(
        children: [
          Center(
            child: Text(
              getNameToday(),
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xff957DCD).withOpacity(0.5),
                  const Color(0xff523D7F).withOpacity(0.6),
                ],
                stops: const [0.1, 1.0],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  decideImage(weatherWeekController.stateUf),
                  fit: BoxFit.fill,
                  scale: 1.1,
                ),
                Text(
                  '${getCurrentDay(weatherWeekController.stateUf.dias[0]).getDegressNow()}º',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 55,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 100),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 8,
              ),
              itemCount: weatherWeekController.stateUf.dias[0].listDays.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListenableProvider(
                        create: (context) => WeatherDayController(
                          stateUf: weatherWeekController.stateUf,
                          dayModel: weatherWeekController
                              .stateUf.dias[0].listDays[index],
                        ),
                        child: const WeatherDayPage(),
                      ),
                    ),
                  );
                },
                child: CardDayWeather(
                  dayModel:
                      weatherWeekController.stateUf.dias[0].listDays[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardDayWeather extends StatelessWidget {
  const CardDayWeather({
    super.key,
    required this.dayModel,
  });
  final DayModel dayModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          dayModel.name.toString().capitalize,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        Row(
          children: [
            Image.asset(
              dayModel.getImageNow(),
              fit: BoxFit.fill,
              scale: 3,
            ),
            const SizedBox(width: 8),
            Text(
              dayModel.getWeatherNow(),
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        Text(
          "+${dayModel.getDegressNow()}º",
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
