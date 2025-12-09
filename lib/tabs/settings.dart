import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/utils/app_colors.dart';
import 'package:todo/bottom_sheets/language_bottomsheet.dart';
import 'package:todo/bottom_sheets/theme_bottomsheet.dart';
import 'package:todo/providers/my_provider.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    final isDark = pro.mode == ThemeMode.dark;
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('theme'.tr(), style: Theme.of(context).textTheme.bodyLarge),
          SizedBox(height: 10),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                isDismissible: true,
                context: context,
                builder: (context) => ThemeBottomsheet(),
              );
            },
            child: Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: AppColors.selectedIcon),
                color: isDark
                    ? AppColors.bottomSheetDark
                    : AppColors.bottomSheetLight,
              ),
              child: Text(
                pro.mode == ThemeMode.dark ? 'dark'.tr() : 'light'.tr(),
                style: TextStyle(color: AppColors.selectedIcon),
              ),
            ),
          ),
          SizedBox(height: 44),
          Text('language'.tr(), style: Theme.of(context).textTheme.bodyLarge),
          SizedBox(height: 12),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                isDismissible: true,
                context: context,
                builder: (context) => LanguageBottomsheet(),
              );
            },
            child: Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: AppColors.selectedIcon),
                color: isDark
                    ? AppColors.bottomSheetDark
                    : AppColors.bottomSheetLight,
              ),
              child: Text(
                context.locale.languageCode == 'ar'
                    ? 'arabic'.tr()
                    : 'english'.tr(),
                style: TextStyle(color: AppColors.selectedIcon),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
