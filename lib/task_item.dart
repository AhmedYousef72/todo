import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/utils/app_colors.dart';
import 'package:todo/firebase_functions.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/tabs/editTask_screen.dart';

class TaskItem extends StatelessWidget {
  final TaskModel taskmodel;

  TaskItem({super.key, required this.taskmodel});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 115,
      margin: EdgeInsets.symmetric(horizontal: 12),
      padding: EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? AppColors.bottomSheetDark : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Slidable(
        startActionPane: ActionPane(
          motion: DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                FirebaseFunctions.deleteTask(taskmodel.id);
              },
              icon: Icons.delete,
              label: "Delete",
              backgroundColor: Colors.red,
              spacing: 8,
              padding: EdgeInsets.zero,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
            ),
            SlidableAction(
              onPressed: (context) {
                Navigator.pushNamed(
                  context,
                  EdittaskScreen.routename,
                  arguments: taskmodel,
                );
              },
              icon: Icons.edit,
              label: "Edit",
              backgroundColor: AppColors.primary,
              spacing: 8,
              padding: EdgeInsets.zero,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 4,
                decoration: BoxDecoration(
                  color: taskmodel.isDone ? AppColors.done : AppColors.primary,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              SizedBox(width: 24),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      taskmodel.title,
                      style: TextStyle(
                        color: taskmodel.isDone
                            ? AppColors.done
                            : AppColors.primary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      taskmodel.subTitle,
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              taskmodel.isDone
                  ? Text(
                      "Done!",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: AppColors.done,
                      ),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        taskmodel.isDone = true;
                        FirebaseFunctions.updateTask(taskmodel);
                      },
                      child: Icon(Icons.done, color: Colors.white, size: 30),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: taskmodel.isDone
                            ? AppColors.done
                            : AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(12),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
