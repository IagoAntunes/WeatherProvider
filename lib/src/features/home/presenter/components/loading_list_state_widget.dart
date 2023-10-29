import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_project/core/styles/app_colors.dart';

class LoadingListStateWidget extends StatelessWidget {
  const LoadingListStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
            itemCount: 6,
            itemBuilder: (context, index) => SizedBox(
              child: Shimmer.fromColors(
                highlightColor: AppColors.card1,
                baseColor: AppColors.primary,
                direction: ShimmerDirection.ltr,
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  margin: const EdgeInsets.only(bottom: 32),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.grey.withOpacity(0.5),
                        Colors.grey.shade800.withOpacity(0.6),
                      ],
                      stops: const [0.1, 1.0],
                    ),
                  ),
                  child: ListTile(
                    title: Container(
                      width: 100,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
