/// Une tâche individuelle avec un titre et un statut de complétion.
class Task {
  /// Le titre de la tâche.
  String title;

  /// Indique si la tâche est complétée ou non.
  bool complete;

  /// La date de début de la tâche.
  DateTime startDate;

  /// La date de fin de la tâche.
  DateTime endDate;

  /// Crée une nouvelle tâche
  Task(this.title, this.complete, this.startDate, this.endDate);
}
