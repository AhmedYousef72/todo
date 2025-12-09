import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/app_colors.dart';
import 'package:todo/providers/my_provider.dart';

class LanguageBottomsheet extends StatelessWidget {
  const LanguageBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<MyProvider>(context);
    final current = context.locale;
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
              onTap: () async {
                await pro.changeLanguage(context, 'ar');
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'arabic'.tr(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: current.languageCode == 'ar'
                          ? AppColors.selectedIcon
                          : (pro.mode == ThemeMode.dark
                                ? AppColors.textOnDark
                                : AppColors.textOnLight),
                      fontSize: 22,
                    ),
                  ),
                  current.languageCode == 'ar'
                      ? Icon(Icons.done, color: AppColors.selectedIcon)
                      : SizedBox(),
                ],
              ),
            ),
            SizedBox(height: 12),
            InkWell(
              onTap: () async {
                await pro.changeLanguage(context, 'en');
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'english'.tr(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: current.languageCode == 'en'
                          ? AppColors.selectedIcon
                          : (pro.mode == ThemeMode.dark
                                ? AppColors.textOnDark
                                : AppColors.textOnLight),
                      fontSize: 22,
                    ),
                  ),
                  current.languageCode == 'en'
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
