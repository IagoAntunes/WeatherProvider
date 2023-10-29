import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_project/core/components/default_scaffold.dart';
import 'package:weather_project/src/features/menu_navigation/menu_controller.dart';
import 'package:weather_project/src/features/profile/presenter/pages/profile_page.dart';

import '../../../core/styles/app_colors.dart';
import '../home/presenter/pages/home_page.dart';
import '../notifications/presenter/pages/notifications_page.dart';
import '../search/presenter/pages/search_page.dart';

class MenuNavigation extends StatelessWidget {
  MenuNavigation({super.key});
  final List<Widget> _listPages = [
    const HomePage(),
    const SearchPage(),
    const ProfilePage(),
    const NotificationsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: ValueListenableBuilder(
        valueListenable: context.read<MenuNavigationController>().index,
        builder: (context, value, child) {
          return _listPages[
              context.read<MenuNavigationController>().index.value];
        },
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: context.read<MenuNavigationController>().index,
      builder: (context, value, child) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration:
                    context.read<MenuNavigationController>().index.value == 0
                        ? const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff957DCD),
                                Color(0xff523D7F),
                              ],
                            ),
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          )
                        : null,
                child: IconButton(
                  onPressed: () {
                    context.read<MenuNavigationController>().changeIndex(0);
                  },
                  icon: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                decoration:
                    context.read<MenuNavigationController>().index.value == 1
                        ? const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff957DCD),
                                Color(0xff523D7F),
                              ],
                            ),
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          )
                        : null,
                child: IconButton(
                  onPressed: () {
                    context.read<MenuNavigationController>().changeIndex(1);
                  },
                  icon: const Icon(
                    Icons.search_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                decoration:
                    context.read<MenuNavigationController>().index.value == 2
                        ? const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff957DCD),
                                Color(0xff523D7F),
                              ],
                            ),
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          )
                        : null,
                child: IconButton(
                  onPressed: () {
                    context.read<MenuNavigationController>().changeIndex(2);
                  },
                  icon: const Icon(
                    Icons.person_outline,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                decoration:
                    context.read<MenuNavigationController>().index.value == 3
                        ? const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff957DCD),
                                Color(0xff523D7F),
                              ],
                            ),
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          )
                        : null,
                child: IconButton(
                  onPressed: () {
                    context.read<MenuNavigationController>().changeIndex(3);
                  },
                  icon: const Icon(
                    Icons.notifications_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
