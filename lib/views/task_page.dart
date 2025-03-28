import 'package:flutter/material.dart';
import 'package:todo_list/views/add_task_view.dart';
import 'package:todo_list/views/header_view.dart';
import 'package:todo_list/views/task_info_view.dart';
import 'package:todo_list/views/task_list_view.dart';

// Page principale affichant la liste des tâches avec une disposition flexible
class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // Corps principal de l'écran avec gestion des zones sensibles
      body: SafeArea(
        // bottom: false évite le chevauchement avec la barre de navigation
        bottom: false,
        child: Column(
          // Division verticale de l'écran en sections flexibles
          children: [
            // En-tête avec 1/9 de la hauteur totale
            Expanded(
              flex: 1,
              child: HeaderView(),
            ),

            // Section d'informations sur les tâches avec 1/9 de la hauteur
            Expanded(
              flex: 1,
              child: TaskInfoView(),
            ),

            // Liste des tâches principale avec 7/9 de la hauteur
            Expanded(
              flex: 7,
              child: TaskListView(),
            ),
          ],
        ),
      ),

      // Bouton flottant pour ajouter une nouvelle tâche
      floatingActionButton: AddTaskView(),
    );
  }
}
