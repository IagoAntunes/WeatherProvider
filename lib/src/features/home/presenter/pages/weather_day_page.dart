import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_project/core/extensions/custom_string_extension.dart';
import 'package:weather_project/src/features/home/presenter/controllers/home_controller.dart';
import 'package:weather_project/src/features/home/presenter/pages/informations_weather_page.dart';

import '../../../../../core/components/default_appbar.dart';
import '../../../../../core/components/default_scaffold.dart';
import '../controllers/weather_day_controller.dart';
import '../utils/functions.dart';

class WeatherDayPage extends StatelessWidget {
  const WeatherDayPage({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherDayController weatherDayController =
        context.read<WeatherDayController>();
    HomeController homeController = context.read<HomeController>();
    return DefaultScaffold(
      appBar: DefaultAppBar(title: weatherDayController.stateUf.estado),
      body: Column(
        children: [
          Center(
            child: Text(
              weatherDayController.dayModel.name.toString().capitalize,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Image.asset(
            decideImage(weatherDayController.stateUf),
            fit: BoxFit.fill,
            scale: 1.1,
          ),
          Text(
            '${weatherDayController.dayModel.getDegressNow()}º',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 55,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            getExtenseDate(),
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Hoje',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.2,
            child: ListView.separated(
              itemCount: weatherDayController.dayModel.getAllPeryods().length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InformationsWeatherPage(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        weatherDayController.dayModel.listNames[index],
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Image.asset(
                        decideImage(weatherDayController.stateUf),
                        fit: BoxFit.fill,
                        scale: 2,
                      ),
                      Text(
                        "${weatherDayController.dayModel.listPeryods[index].degrees}º",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Estados',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.08,
            child: ListView.separated(
              itemCount: homeController.listStates.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      weatherDayController.dayModel.getImageNow(),
                      fit: BoxFit.fill,
                      scale: 3,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      homeController.listStates[index].estado,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "${getCurrentDay(homeController.listStates[index].dias[0]).getDegressNow()}º",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
