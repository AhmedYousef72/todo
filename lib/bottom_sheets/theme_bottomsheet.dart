import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/app_colors.dart';
import 'package:todo/providers/my_provider.dart';

class ThemeBottomsheet extends StatelessWidget {
  const ThemeBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<MyProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: pro.mode == ThemeMode.dark
            ? AppColors.bottomSheetDark
            : AppColors.bottomSheetLight,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.3,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                pro.changeTheme(ThemeMode.light);
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'light'.tr(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.selectedIcon,
                      fontSize: 22,
                    ),
                  ),
                  pro.mode == ThemeMode.light
                      ? Icon(Icons.done, color: AppColors.selectedIcon)
                      : SizedBox(),
                ],
              ),
            ),
            SizedBox(height: 12),
            InkWell(
              onTap: () {
                pro.changeTheme(ThemeMode.dark);
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'dark'.tr(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.selectedIcon,
                      fontSize: 22,
                    ),
                  ),
                  pro.mode == ThemeMode.dark
                      ? Icon(Icons.done, color: AppColors.selectedIcon)
                      : SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
