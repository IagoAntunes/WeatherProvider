import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_project/core/components/default_appbar.dart';
import 'package:weather_project/core/components/default_scaffold.dart';
import 'package:weather_project/core/styles/app_images.dart';

class InformationsWeatherPage extends StatelessWidget {
  const InformationsWeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: const DefaultAppBar(title: 'Informações'),
      horizontalPadding: 0,
      body: GridView.builder(
        padding: const EdgeInsets.all(5),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: AppImages.listImages.length,
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xff201a63),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(24),
              child: Image.asset(
                AppImages.listImages[index].values.toList()[0],
                fit: BoxFit.fill,
                scale: 3,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              AppImages.listImages[index].keys.toList()[0],
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
