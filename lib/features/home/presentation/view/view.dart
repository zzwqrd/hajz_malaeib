import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';

import '../viewModel/controller.dart';

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
        BlocBuilder(
          bloc: KiwiContainer().resolve<ControllerData>()..getData(),
          builder: (context, StateTest state) {
            switch (state.status) {
              case Status.initial:
                return const SizedBox();
              case Status.start:
                return const Center(child: CircularProgressIndicator());
              case Status.success:
                return CarouselSlider(
                  items:
                      List.generate(state.dataLocalModels!.length, (int index) {
                    return Container(
                      margin: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        child: Image.network(
                          state.dataLocalModels![index].url,
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 130.0.h,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                    scrollPhysics: const BouncingScrollPhysics(),
                  ),
                );
              case Status.failed:
                return Center(child: Text(state.error!));
            }
          },
        ),
      ],
    );
  }
}
