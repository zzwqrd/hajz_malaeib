import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hajz_malaeib/generated/locale_keys.g.dart';
import 'package:kiwi/kiwi.dart';

import '../../../../generated/assets.dart';
import '../view_model/bloc/bloc.dart';
import '../view_model/bloc/event.dart';
import '../view_model/bloc/state.dart';
import 'widget/custom_bottom_nav_item.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  final NavigationBloc _bloc = KiwiContainer().resolve()
    ..add(UpdateNavigationIndex(newIndex: 0));

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: BlocBuilder<NavigationBloc, NavigationState>(
          bloc: _bloc,
          builder: (context, state) {
            return Text(_bloc.getTextForValue(state.currentIndex));
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: Image.asset(
              Assets.iconsLogo,
              width: 100.w,
            ),
          ),
        ],
      ),
      body: BlocBuilder<NavigationBloc, NavigationState>(
        bloc: _bloc,
        builder: (context, state) {
          return [
            Center(child: Text(_bloc.state.currentIndex.toString())),
            Center(child: Text(_bloc.state.currentIndex.toString())),
            Center(child: Text(_bloc.state.currentIndex.toString())),
          ][state.currentIndex];
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
        bloc: _bloc,
        builder: (context, state) {
          return SizedBox(
            height: 77.h,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.grey.withOpacity(0.5),
                    width: 1.0,
                  ),
                ),
              ),
              child: BottomNavigationBar(
                // iconSize: 11,
                type: BottomNavigationBarType.fixed,
                currentIndex: state.currentIndex,
                onTap: (index) {
                  _bloc.add(UpdateNavigationIndex(newIndex: index));
                },
                selectedFontSize: 11,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                selectedItemColor: const Color(0xFF0790C3),
                unselectedItemColor: Colors.white,
                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                  color: Color(0xFF0790C3),
                ),
                selectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                  color: Color(0xFF0790C3),
                ),
                items: <BottomNavigationBarItem>[
                  buildBottomNavigationBarItem(
                      label: tr(LocaleKeys.home),
                      icon: Assets.iconsHome,
                      iconActive: Assets.iconsHomeActive,
                      isActive: state.currentIndex == 0),
                  buildBottomNavigationBarItem(
                      label: tr(LocaleKeys.stadium),
                      icon: Assets.iconsFootballField,
                      iconActive: Assets.iconsFootballFieldActive,
                      isActive: state.currentIndex == 1),
                  buildBottomNavigationBarItem(
                      label: tr(LocaleKeys.more),
                      icon: Assets.iconsMore,
                      iconActive: Assets.iconsMoreActive,
                      isActive: state.currentIndex == 2),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
