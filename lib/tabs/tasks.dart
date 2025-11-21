import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/app_colors.dart';
import 'package:todo/firebase_functions.dart';
import 'package:todo/task_item.dart';

class TaskTab extends StatefulWidget {
  TaskTab({super.key});

  @override
  State<TaskTab> createState() => _TaskTabState();
}

class _TaskTabState extends State<TaskTab> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          ),

          child: EasyDateTimeLinePicker(
            firstDate: DateTime(2000, 1, 1),
            lastDate: DateTime(2035, 3, 18),
            focusedDate: date,
            selectionMode: SelectionMode.autoCenter(),
            locale: Locale("ar"),
            disableStrategy: DisableStrategy.beforeToday(),

            onDateChange: (datetime) {
              setState(() {
                date = datetime;
              });
              // Handle the selected date.
            },
          ),
        ),
        SizedBox(height: 18),

        StreamBuilder(
          stream: FirebaseFunctions.getTask(date),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Center(
                child: Column(
                  children: [
                    Text("Something went wrong"),
                    ElevatedButton(onPressed: () {}, child: Text("Try Again")),
                  ],
                ),
              );
            }
            var tasks = snapshot.data?.docs.map((doc) => doc.data()).toList();
            if (tasks!.isEmpty) {
              return Center(child: Text("No Tasks"));
            }
            return Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return TaskItem(taskmodel: tasks[index]);
                },
                itemCount: tasks.length,
              ),
            );
          },
        ),
      ],
    );
  }
}
