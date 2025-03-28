import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/view_models/app_view_model.dart';
import 'package:todo_list/views/bottom_sheets/add_task_bottom_sheet_view.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return Container(
          height: 60,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: viewModel.clrLvl3,
              foregroundColor: viewModel.clrLvl1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: viewModel.clrLvl4.withOpacity(0.2),
                  width: 1,
                ),
              ),
              elevation: 2,
              shadowColor: viewModel.clrLvl4.withOpacity(0.2),
              padding: const EdgeInsets.symmetric(horizontal: 24),
            ),
            onPressed: () {
              HapticFeedback.heavyImpact();
              viewModel.bottomSheetBuilder(
                const AddTaskBottomSheetView(),
                context,
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.add,
                  size: 30,
                ),
                const SizedBox(width: 8),
                Text(
                  'Ajouter une tâche',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: viewModel.clrLvl1,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
