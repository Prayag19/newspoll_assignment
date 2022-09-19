import 'package:flutter/material.dart';
import 'package:newspoll/ui/utils/app_colors.dart';
import 'package:newspoll/ui/utils/app_icons.dart';
import 'package:newspoll/ui/utils/extensions.dart';

import 'feed_page/feed_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List icons = [
    AppIcons.icNavFeed,
    AppIcons.icNavMarket,
    AppIcons.icNavPortFolio,
    AppIcons.icNavProfile,
  ];
  int selectedTab = 0;
  List pages = const [
    FeedPage(),
    Center(child: Text("Portfolio Page")),
    Center(child: Text("Markets Page")),
    Center(child: Text("Profile Page")),
  ];
  List<BottomNavigationBarItem> navBarItems = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    navBarItems = List.generate(icons.length, (index) {
      return BottomNavigationBarItem(
          icon: NavBarIcon(
            position: index,
            selectedPosition: selectedTab,
            iconData: icons[index],
          ),
          label: "");
    });

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,

        selectedIconTheme: const IconThemeData(
          size: 28
        ),
        unselectedIconTheme: const IconThemeData(
            size: 24
        ),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: Colors.transparent,
        unselectedItemColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        items: navBarItems,
                onTap: (int index) {
          setState(() {
            selectedTab = index;
          });
        },
        currentIndex: selectedTab,

      ),
      body: pages[selectedTab],
    );
  }
}

class NavBarIcon extends StatelessWidget {
  final int selectedPosition;
  final int position;
  final String iconData;
  const NavBarIcon(
      {Key? key,
      required this.iconData,
      required this.position,
      required this.selectedPosition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: context.responsive(43, axis: Axis.horizontal),
        height: context.responsive(28, axis: Axis.vertical),
        decoration: BoxDecoration(
            borderRadius: (selectedPosition == position)
                ? BorderRadius.circular(
                    context.responsive(40, axis: Axis.horizontal),
                  )
                : null,
            gradient: (selectedPosition == position)
                ? const LinearGradient(
                    colors: [Colors.white, AppColors.kNavBarSelectedIconColor],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                  )
                : null),
        child: ImageIcon(
          AssetImage(iconData),
          color: (selectedPosition == position)
              ? Colors.white
              : AppColors.kNavBarUnselectedIconColor,
        ),
    );
  }
}
