import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/view_models/app_view_model.dart';
import '../../models/task_model.dart';

class AddTaskBottomSheetView extends StatelessWidget {
  const AddTaskBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController entryController = TextEditingController();

    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: viewModel.clrLvl2,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Barre de traction
                Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 16),
                  child: Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: viewModel.clrLvl4.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),

                // Titre
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Nouvelle Tâche',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: viewModel.clrLvl4,
                    ),
                  ),
                ),

                // Champ de texte
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextField(
                    minLines: 1,
                    maxLines: 3,
                    expands: false,
                    decoration: InputDecoration(
                      hintText: 'Entrez votre tâche',
                      hintStyle:
                          TextStyle(color: viewModel.clrLvl4.withOpacity(0.6)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                    ),
                    style: TextStyle(
                      color: viewModel.clrLvl4,
                      fontSize: 16,
                    ),
                    controller: entryController,
                    autofocus: true,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (value) {
                      if (entryController.text.isNotEmpty) {
                        // Création de la tâche avec la date de début et de fin
                        DateTime startDate = DateTime.now();
                        DateTime endDate = startDate.add(
                            Duration(days: 7)); // Exemple : 7 jours de durée
                        Task newTask = Task(
                            entryController.text, false, startDate, endDate);
                        viewModel.addTask(newTask);
                        entryController.clear();
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ),

                // Bouton d'action
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      if (entryController.text.isNotEmpty) {
                        // Création de la tâche avec la date de début et de fin
                        DateTime startDate = DateTime.now();
                        DateTime endDate = startDate.add(
                            Duration(days: 7)); // Exemple : 7 jours de durée
                        Task newTask = Task(
                            entryController.text, false, startDate, endDate);
                        viewModel.addTask(newTask);
                        entryController.clear();
                        Navigator.of(context).pop();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: viewModel.clrLvl4,
                      foregroundColor: viewModel.clrLvl2,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Ajouter'),
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
