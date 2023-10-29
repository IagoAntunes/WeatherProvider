import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardStateWeather extends StatelessWidget {
  const CardStateWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 0.8,
            margin: const EdgeInsets.only(bottom: 32),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
            child: ListTile(
              title: Text(
                "Ceara",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Image.asset(
              'assets/images/rain_night1.png',
              fit: BoxFit.fill,
              scale: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
