import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:synclass_app/router/router.dart';

import 'package:synclass_app/screens/screens.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  List<Widget> _buildScreens() {
      return const [
        AlertsScreen(),
        GroupsScreen(),
        AgendaScreen(),
        ConfigurationScreen(),
      ];
  }
  
  List<PersistentBottomNavBarItem> _navBarsItems() {
        return [
            PersistentBottomNavBarItem(
              icon: const Icon(CupertinoIcons.bell),
              title: ("Alerts"),
              activeColorPrimary: CupertinoColors.activeBlue,
              inactiveColorPrimary: CupertinoColors.systemGrey,
              routeAndNavigatorSettings: RouteAndNavigatorSettings(
                routes: routes
              )
            ),
            PersistentBottomNavBarItem(
              icon: const Icon(CupertinoIcons.group),
              title: ("Groups"),
              activeColorPrimary: CupertinoColors.activeBlue,
              inactiveColorPrimary: CupertinoColors.systemGrey,
              routeAndNavigatorSettings: RouteAndNavigatorSettings(
                routes: routes
              )
            ),
            PersistentBottomNavBarItem(
              icon: const Icon(CupertinoIcons.calendar),
              title: ("Agenda"),
              activeColorPrimary: CupertinoColors.activeBlue,
              inactiveColorPrimary: CupertinoColors.systemGrey,
              routeAndNavigatorSettings: RouteAndNavigatorSettings(
                routes: routes
              )
            ),
            PersistentBottomNavBarItem(
              icon: const Icon(CupertinoIcons.settings),
              title: ("Settings"),
              activeColorPrimary: CupertinoColors.activeBlue,
              inactiveColorPrimary: CupertinoColors.systemGrey,
              routeAndNavigatorSettings: RouteAndNavigatorSettings(
                routes: routes
              )
            ),
        ];
    }

  @override
  Widget build(BuildContext context) {

    PersistentTabController controller = PersistentTabController(initialIndex: 1);

    return PersistentTabView(
        context,
        controller: controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: const NavBarDecoration(
          border: BorderDirectional(
            top: BorderSide(
              color: Color(0xff5271FF),
              width: 4
            )
          )
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style13, // Choose the nav bar style with this property.
    );
  }
}