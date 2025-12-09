import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:todo/utils/app_colors.dart';
import 'package:todo/firebase_functions.dart';
import 'package:todo/models/task_model.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime selectedDate = DateTime.now();
  var titleController = TextEditingController();
  var subtitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "add_new_task".tr(),
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 24),
          TextFormField(
            controller: titleController,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              label: Text("task_title".tr()),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
          SizedBox(height: 18),
          TextFormField(
            controller: subtitleController,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              label: Text("task_description".tr()),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
          SizedBox(height: 18),
          Text(
            "select_date".tr(),
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 18),
          InkWell(
            onTap: () {
              SelectedDate();
            },
            child: Text(
              selectedDate.toString().substring(0, 10),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: AppColors.primary,
              ),
            ),
          ),
          SizedBox(height: 18),

          ElevatedButton(
            onPressed: () {
              TaskModel task = TaskModel(
                userId: FirebaseAuth.instance.currentUser!.uid,
                title: titleController.text,
                subTitle: subtitleController.text,
                date: DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch,
              );
              FirebaseFunctions.addTask(task).then((value) {
                Navigator.pop(context);
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.selectedIcon,
            ),
            child: Text(
              "add_task".tr(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SelectedDate() async {
    DateTime? chosenDate = await showDatePicker(
      context: context,
      builder: (context, child) => Theme(
        data: Theme.of(
          context,
        ).copyWith(colorScheme: ColorScheme.light(primary: AppColors.primary)),
        child: child!,
      ),
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
  }
}
