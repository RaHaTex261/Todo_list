import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/view_models/app_view_model.dart';

import 'views/task_page.dart';

// Point d'entrée de l'application Flutter
void main() {
  // Initialise l'application avec le Provider de gestion d'état
  runApp(ChangeNotifierProvider(
      // Crée une instance du AppViewModel comme source de vérité
      create: (context) => AppViewModel(),
      // Transmet le modèle à tous les widgets enfants
      child: const MyApp()));
}

// Application principale avec Material Design
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Définit la page d'accueil comme TaskPage
      home: TaskPage(),
    );
  }
}
