import 'package:flutter/material.dart';
import 'package:todo_list/models/task_model.dart';
import 'package:todo_list/models/user_model.dart';

/// Un gestionnaire d'état d'application qui maintient les tâches et l'utilisateur actuel.
class AppViewModel extends ChangeNotifier {
  /// Liste des tâches actuelles dans l'application
  List<Task> tasks = <Task>[];

  /// L'utilisateur actuellement connecté
  User user = User("Ranto Teddy");

  /// Couleurs de niveau pour le thème de l'application
  Color clrLvl1 = Colors.blue.shade50; // Bleu très clair
  Color clrLvl2 = Colors.blue.shade200; // Bleu clair
  Color clrLvl3 = Colors.blue.shade700; // Bleu profond
  Color clrLvl4 = Colors.blue.shade900; // Bleu foncé

  /// Retourne le nombre total de tâches
  int get numTasks => tasks.length;

  /// Retourne le nombre de tâches non complétées
  int get numTasksRemaining => tasks.where((task) => !task.complete).length;

  /// Retourne le nom d'utilisateur actuel
  String get username => user.username;

  /// Ajoute une nouvelle tâche à la liste et notifie les écouteurs
  void addTask(Task newTask) {
    tasks.add(newTask);
    notifyListeners();
  }

  /// Retourne l'état de complétion d'une tâche spécifique
  bool getTaskValue(int taskIndex) {
    return tasks[taskIndex].complete;
  }

  /// Retourne le titre d'une tâche spécifique
  String getTaskTitle(int taskIndex) {
    return tasks[taskIndex].title;
  }

  /// Supprime une tâche de la liste et notifie les écouteurs
  void deleteTask(int taskIndex) {
    tasks.removeAt(taskIndex);
    notifyListeners();
  }

  /// Met à jour l'état de complétion d'une tâche et notifie les écouteurs
  void setTaskValue(int taskIndex, bool taskValue) {
    tasks[taskIndex].complete = taskValue;
    notifyListeners();
  }

  /// Met à jour le nom d'utilisateur et notifie les écouteurs
  void updateUsername(String newUsername) {
    user.username = newUsername;
    notifyListeners();
  }

  /// Supprime toutes les tâches de la liste et notifie les écouteurs
  void deleteAllTasks() {
    tasks.clear();
    notifyListeners();
  }

  /// Supprime uniquement les tâches complétées et notifie les écouteurs
  void deleteCompletedTasks() {
    tasks = tasks.where((task) => !task.complete).toList();
    notifyListeners();
  }

  /// Affiche une vue de type bottom sheet avec l'animation et le style spécifiés
  void bottomSheetBuilder(Widget bottomSheetView, BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: ((context) {
        return bottomSheetView;
      }),
    );
  }

  /// Retourne la date de début d'une tâche
  String getTaskStartDate(int index) {
    DateTime startDate = tasks[index].startDate;
    // Formater la date selon tes besoins, par exemple, avec 'dd/MM/yyyy'
    return "${startDate.day.toString().padLeft(2, '0')}/${startDate.month.toString().padLeft(2, '0')}/${startDate.year}";
  }

  /// Retourne la date de fin d'une tâche
  String getTaskEndDate(int index) {
    DateTime endDate = tasks[index].endDate;
    // Formater la date selon tes besoins, par exemple, avec 'dd/MM/yyyy'
    return "${endDate.day.toString().padLeft(2, '0')}/${endDate.month.toString().padLeft(2, '0')}/${endDate.year}";
  }
}
