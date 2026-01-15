import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_with_backend/pages/home/main_food_page.dart';

import '../../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   // late ScrollController scrollController;
  // late PersistentTabController _controller;
  int selectIndex = 0;
  List pages = [
    MainFoodPage(),
    Center(child: Container(child: Text("page1"),)),
    Center(child: Container(child: Text("page1"),)),
    Center(child: Container(child: Text("page1"),)),
  ];

  onTapNav(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectIndex],
      bottomNavigationBar:BottomNavigationBar(
        onTap:onTapNav ,
        selectedItemColor: Colors.tealAccent.shade700,
          unselectedItemColor: Colors.amberAccent,
          currentIndex: selectIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0.0,
          unselectedFontSize: 0.0,
          items: const [
            BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined,),
              label: "Home"
            ),
            BottomNavigationBarItem(
          icon: Icon(Icons.archive_outlined,),
              label: "History"
            ),
            BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined,),
              label: "Cart"
            ),
            BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined,),
              label: "Me"
            ),
    ] ,
      )
    );
  }
}
// void initState(){
//     super.initState();
//     _controller = PersistentTabController(initialIndex: 0);
//     scrollController = ScrollController();
//   }
//
//   List<Widget> _buildScreens() {
//     return [
//       MainFoodPage(),
//       Center(child: Container(child: Text("page1"),)),
//       Center(child: Container(child: Text("page2"),)),
//       Center(child: Container(child: Text("page3"),)),
//     ];
//   }
//   List<PersistentBottomNavBarItem> _navBarsItems() {
//     return [
//       PersistentBottomNavBarItem(
//         icon: Icon(CupertinoIcons.home),
//         title: ("Home"),
//         activeColorPrimary: CupertinoColors.activeBlue,
//         inactiveColorPrimary: CupertinoColors.systemGrey,
//         scrollController: scrollController,
//         routeAndNavigatorSettings: RouteAndNavigatorSettings(
//           initialRoute: "/",
//           routes: {
//             "/first": (final context) => const  MainFoodPage(),
//             "/second": (final context) => Center(child: Container(child: Text("page1"),)),
//           },
//         ),
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(CupertinoIcons.archivebox_fill),
//         title: ("Archive"),
//         activeColorPrimary: CupertinoColors.activeBlue,
//         inactiveColorPrimary: CupertinoColors.systemGrey,
//         scrollController: scrollController,
//         routeAndNavigatorSettings: RouteAndNavigatorSettings(
//           initialRoute: "/",
//           routes: {
//             "/first": (final context) =>  Center(child: Container(child: Text("page1"),)),
//             "/second": (final context) =>  Center(child: Container(child: Text("page2"),)),
//           },
//         ),
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(CupertinoIcons.cart_fill),
//         title: ("Cart"),
//         activeColorPrimary: CupertinoColors.activeBlue,
//         inactiveColorPrimary: CupertinoColors.systemGrey,
//         scrollController: scrollController,
//         routeAndNavigatorSettings: RouteAndNavigatorSettings(
//           initialRoute: "/",
//           routes: {
//             "/first": (final context) =>  Center(child: Container(child: Text("page1"),)),
//             "/second": (final context) =>  Center(child: Container(child: Text("page1"),)),
//           },
//         ),
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(CupertinoIcons.person),
//         title: ("Me"),
//         activeColorPrimary: CupertinoColors.activeBlue,
//         inactiveColorPrimary: CupertinoColors.systemGrey,
//         scrollController: scrollController,
//         routeAndNavigatorSettings: RouteAndNavigatorSettings(
//           initialRoute: "/",
//           routes: {
//             "/first": (final context) =>  Center(child: Container(child: Text("page1"),)),
//             "/second": (final context) =>  Center(child: Container(child: Text("page1"),)),
//           },
//         ),
//       ),
//     ];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//   return PersistentTabView(
//   context,
//   controller: _controller,
//   screens: _buildScreens(),
//   items: _navBarsItems(),
//   handleAndroidBackButtonPress: true, // Default is true.
//   resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
//   stateManagement: true, // Default is true.
//   hideNavigationBarWhenKeyboardAppears: true,
//   // popBehaviorOnSelectedNavBarItemPress: PopActionScreensType.all,
//   padding: const EdgeInsets.only(top: 8),
//   backgroundColor: Colors.grey.shade200,
//   isVisible: true,
//   animationSettings: const NavBarAnimationSettings(
//   navBarItemAnimation: ItemAnimationSettings( // Navigation Bar's items animation properties.
//   duration: Duration(milliseconds: 400),
//   curve: Curves.ease,
//   ),
//   screenTransitionAnimation: ScreenTransitionAnimationSettings( // Screen transition animation on change of selected tab.
//   animateTabTransition: true,
//   duration: Duration(milliseconds: 200),
//   screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
//   ),
//   ),
//   confineToSafeArea: true,
//   navBarHeight: kBottomNavigationBarHeight,
//     navBarStyle: NavBarStyle.style1,
//   // Choose the nav bar style with this property
//   );
//   }




