import 'package:flutter/material.dart';
import 'package:frontend/views/ui/Home.dart';
import 'package:frontend/views/ui/ProductPage.dart';
import 'package:frontend/views/ui/ProfilePage.dart';
import 'package:frontend/views/ui/SearchPage.dart';
import 'package:frontend/views/ui/SettingsPage.dart';
import 'package:community_material_icon/community_material_icon.dart';

import 'package:provider/provider.dart';

import '../../controllers/mainscreen_provider.dart';
import '../widgets/bottom_navigation_bar.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> pageList = [
    HomePage(),
    ProductPage(),
    ProfilePage(),
    SearchPage(),
    SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    //  int pageIndex = 0;
    return Consumer<MainScreenNotifier>(
        builder: (context, mainScreenNotifier, child) {
      return Scaffold(
          backgroundColor: Color(0xFFE2E2E2),
          bottomNavigationBar: SafeArea(
              child: Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(16)),
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BottomNavigationbar(
                      onTap: () {
                        mainScreenNotifier.PageIndex = 0;
                      },
                      icon: mainScreenNotifier.pageIndex == 0
                          ? CommunityMaterialIcons.home
                          : CommunityMaterialIcons.home_outline),
                  BottomNavigationbar(
                    onTap: () {
                      mainScreenNotifier.PageIndex = 1;
                    },
                    icon: mainScreenNotifier.pageIndex == 1
                        ? CommunityMaterialIcons.map_search
                        : CommunityMaterialIcons.map_search_outline,
                  ),
                  BottomNavigationbar(
                    onTap: () {
                      mainScreenNotifier.PageIndex = 2;
                    },
                    icon: mainScreenNotifier.pageIndex == 2
                        ? CommunityMaterialIcons.alarm
                        : CommunityMaterialIcons.alarm_light,
                  ),
                  BottomNavigationbar(
                    onTap: () {
                      mainScreenNotifier.PageIndex = 3;
                    },
                    icon: mainScreenNotifier.pageIndex == 3
                        ? CommunityMaterialIcons.cart
                        : CommunityMaterialIcons.cart_outline,
                  ),
                  BottomNavigationbar(
                    onTap: () {
                      mainScreenNotifier.PageIndex = 4;
                    },
                    icon: mainScreenNotifier.pageIndex == 4
                        ? CommunityMaterialIcons.account
                        : CommunityMaterialIcons.account_network_outline,
                  )
                ],
              ),
            ),
          )),
          body: pageList[mainScreenNotifier.pageIndex]);
    });
  }
}
