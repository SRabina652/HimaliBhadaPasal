import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:himali_bhada_pasal/pages/account/account_page.dart';
import 'package:himali_bhada_pasal/pages/cart/cart_history.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../utils/colors.dart';
import 'main_utensils_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  late PersistentTabController _controller;


  List pages = [
    MainUtensilsPage(),
    Container(
      child: Center(child: Text("Second page")),
    ),
    Container(
      child: Text("Third page"),
    ),
    Container(
      child: Text("Fourth page"),
    ),
  ];

  void onTapNav(int index){
    setState(() {
      _selectedIndex= index;
    });
  }
  @override
  void initState(){
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: pages[_selectedIndex],
  //     bottomNavigationBar: BottomNavigationBar(
  //       selectedItemColor: Colors.black,
  //       unselectedItemColor: Colors.black38,
  //       showUnselectedLabels: false,
  //       selectedFontSize: 0.0,
  //       unselectedFontSize: 0.0,
  //       showSelectedLabels: false,
  //       currentIndex: _selectedIndex,
  //       onTap: onTapNav,
  //       items: [
  //         BottomNavigationBarItem(
  //             icon: Icon(Icons.home_outlined,),
  //         label: "Home"),
  //         BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined,),
  //             label: "cart"),
  //         BottomNavigationBarItem(icon: Icon(Icons.archive,),
  //             label: "History"),
  //         BottomNavigationBarItem(icon: Icon(Icons.person,),
  //             label: "profile"),
  //       ],
  //     ),
  //   );
  // }

  List<Widget> _buildScreens() {
    return [
      MainUtensilsPage(),
      Container(
        child: Center(child: Text("Second page")),
      ),
      CartHistory(),
      AccountPage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: AppColors.mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.archivebox_fill),
        title: ("History"),
        activeColorPrimary: AppColors.mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.cart_fill),
        title: ("Cart"),
        activeColorPrimary: AppColors.mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person),
        title: ("User"),
        activeColorPrimary: AppColors.mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      // Default is Colors.white.
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle
          .style5, // Choose the nav bar style with this property.
    );
  }
}
