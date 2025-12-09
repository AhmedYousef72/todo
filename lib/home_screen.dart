import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/utils/app_colors.dart';
import 'package:todo/bottom_sheets/add_task_bottom_sheet.dart';
import 'package:todo/providers/my_provider.dart';
import 'package:todo/register/login.dart';
import 'package:todo/tabs/settings.dart';
import 'package:todo/tabs/tasks.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static const String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    final isDark = provider.mode == ThemeMode.dark;
    return Scaffold(
      extendBody: true,
      backgroundColor: isDark ? AppColors.scaffoldDark : Color(0xFFDFECDB),
      appBar: AppBar(
        toolbarHeight: 157,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            selectedIndex == 1
                ? 'Settings'
                : "Hello ${provider.userModel?.Username},",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushNamedAndRemoveUntil(
                context,
                LoginScreen.routeName,
                (route) => false,
              );
            },
          ),
        ],
      ),

      body: tabs[selectedIndex],

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: AppColors.primary,
        shape: CircleBorder(side: BorderSide(color: Colors.white, width: 4)),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => Padding(
              //      we made padding in this form to eable to open the keyboard with the tab of tasks when open it
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: AddTaskBottomSheet(),
            ),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: BottomAppBar(
        color: isDark ? AppColors.navBarDark : AppColors.navBarLight,
        padding: EdgeInsets.zero,
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          currentIndex: selectedIndex,
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          selectedItemColor: AppColors.selectedIcon,
          unselectedItemColor: AppColors.unselectedIcon,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> tabs = [TaskTab(), SettingsTab()];
