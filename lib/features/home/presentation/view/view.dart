import 'package:flutter/material.dart';

import 'widgets/carousel_slider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSliderApp(),
      ],
    );
  }
}
