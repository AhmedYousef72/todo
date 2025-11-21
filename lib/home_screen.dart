import 'package:flutter/material.dart';
import 'package:todo/app_colors.dart';
import 'package:todo/bottom_sheets/add_task_bottom_sheet.dart';
import 'package:todo/tabs/settings.dart';
import 'package:todo/tabs/tasks.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static const String routename = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.Sec,
      appBar: AppBar(
        toolbarHeight: 157,
        backgroundColor: AppColors.primary,
        title: Text(
          "To Do List",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
        ),
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
        color: Colors.white,
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
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.Grey,
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
