import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:salesforce/view/home/driver/controller/home.driver.controller.dart';
import 'package:flutter/material.dart';
import 'package:salesforce/view/home/driver/profileDriver.fragment.dart';

import 'homeDriver.fragment.dart';

class HomeDriver extends GetView<HomeDriverController> {
  HomeDriver({super.key});

  final controllerBar = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreen(value) {
    return [
      HomeDriverFragment(),
      Container(),
      Container(),
      Container(),
      ProfileDriverFragment(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        inactiveIcon: Icon(Icons.home, color: Colors.grey,),
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {
            "/first": (final context) => HomeDriverFragment(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.history),
          inactiveIcon: Icon(Icons.history, color: Colors.grey,)),
      PersistentBottomNavBarItem(
          icon: Image.asset('assets/icons/login.png',)),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.production_quantity_limits),
          inactiveIcon: Icon(Icons.production_quantity_limits, color: Colors.grey,)),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.person),
          inactiveIcon: Icon(Icons.person, color: Colors.grey,)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PersistentTabView(
          context,
          controller: controllerBar,
          screens: _buildScreen(controller.currentIndex.value),
          items: _navBarItems(),
          backgroundColor: Colors.white,
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(1),
          ),
          navBarStyle: NavBarStyle.style15,
        ),
      ),
    );
  }
}
