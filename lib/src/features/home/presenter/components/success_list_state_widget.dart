import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_project/core/styles/app_colors.dart';
import 'package:weather_project/src/features/home/presenter/controllers/home_controller.dart';
import 'package:weather_project/src/features/home/presenter/controllers/wather_week_controller.dart';
import 'package:weather_project/src/features/home/presenter/pages/weather_week_page.dart';
import 'package:weather_project/src/features/home/presenter/utils/functions.dart';

class SuccessListStateWidget extends StatelessWidget {
  const SuccessListStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = context.read<HomeController>();
    return Column(
      children: [
        Text(
          "Pesquisar pelo Estado",
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 50),
        Expanded(
          child: ListView.builder(
            itemCount: homeController.listStates.length,
            itemBuilder: (context, index) => SizedBox(
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListenableProvider(
                            create: (context) => WeatherWeekController(
                              stateUf: homeController.listStates[index],
                            ),
                            child: const WeatherWeekPage(),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      margin: const EdgeInsets.only(bottom: 32),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.card1.withOpacity(0.5),
                            AppColors.card2.withOpacity(0.6),
                          ],
                          stops: const [0.1, 1.0],
                        ),
                      ),
                      child: ListTile(
                        title: Text(
                          context
                              .read<HomeController>()
                              .listStates[index]
                              .estado,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Image.asset(
                      decideImage(homeController.listStates[index]),
                      fit: BoxFit.fill,
                      scale: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
