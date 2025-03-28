import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/view_models/app_view_model.dart';

// Classe principale qui affiche une liste de tâches
class TaskListView extends StatelessWidget {
  // Constructeur avec clé optionnelle pour l'identification du widget
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    // Utilisation de Consumer pour accéder au AppViewModel
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return Container(
        // Définit la couleur d'arrière-plan et les bordures arrondies
        decoration: BoxDecoration(
            color: viewModel.clrLvl2,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(30))),
        child: ListView.separated(
          // Espacement interne de la liste
          padding: const EdgeInsets.all(15),

          // Fonction pour créer les séparateurs entre les éléments
          separatorBuilder: (context, index) {
            return const SizedBox(
                height: 15); // Espace vertical entre les tâches
          },

          // Nombre total de tâches à afficher
          itemCount: viewModel.numTasks,

          // Construit chaque élément de la liste
          itemBuilder: (context, index) {
            return Dismissible(
              // Clé unique pour identifier chaque élément glissable
              key: UniqueKey(),

              // Action lorsqu'une tâche est glissée vers la gauche/droite
              onDismissed: (direction) {
                HapticFeedback.mediumImpact(); // Retour tactile
                viewModel.deleteTask(index); // Supprime la tâche
              },

              // Fond rouge apparaissant lors du glissement
              background: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    color: Colors.red.shade300,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Icon(Icons.delete, color: Colors.red.shade700)),
              ),

              // Conteneur principal de la tâche
              child: Container(
                decoration: BoxDecoration(
                    color: viewModel.clrLvl1,
                    borderRadius: BorderRadius.circular(20)),
                child: ListTile(
                  // Case à cocher en tant qu'élément principal
                  leading: Checkbox(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    side: BorderSide(width: 2, color: viewModel.clrLvl3),
                    checkColor: viewModel.clrLvl1,
                    activeColor: viewModel.clrLvl3,
                    value: viewModel.getTaskValue(index),
                    onChanged: (value) {
                      viewModel.setTaskValue(index, value!);
                    },
                  ),

                  // Titre de la tâche
                  title: Text(viewModel.getTaskTitle(index),
                      style: TextStyle(
                          color: viewModel.clrLvl4,
                          fontSize: 17,
                          fontWeight: FontWeight.w500)),

                  // Affichage des dates de début et de fin
                  subtitle: Row(
                    children: [
                      Text(
                        'Début: ${viewModel.getTaskStartDate(index)}',
                        style: TextStyle(
                          color: viewModel.clrLvl4.withOpacity(0.7),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Fin: ${viewModel.getTaskEndDate(index)}',
                        style: TextStyle(
                          color: viewModel.clrLvl4.withOpacity(0.7),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
