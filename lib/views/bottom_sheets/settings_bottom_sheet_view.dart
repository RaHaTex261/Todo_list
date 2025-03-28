import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/view_models/app_view_model.dart';

/// Une vue de bottom sheet permettant de modifier les paramètres de l'application.
class SettingsBottomSheetView extends StatelessWidget {
  const SettingsBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    // Contrôleur pour gérer le texte saisi dans le champ de saisie
    final TextEditingController entryController = TextEditingController();

    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return Padding(
          // Ajuste le padding en fonction de la zone de clavier pour éviter le chevauchement
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SizedBox(
            // Hauteur fixe pour la vue de saisie
            height: 80,
            child: Center(
              child: SizedBox(
                // Dimensions du champ de texte
                height: 40,
                width: 250,
                child: TextField(
                    // Gère la soumission du texte (appui sur Entrée)
                    onSubmitted: (value) {
                      if (entryController.text.isNotEmpty) {
                        // Met à jour le nom d'utilisateur dans le modèle
                        viewModel.updateUsername(entryController.text);
                      }
                      // Ferme le bottom sheet après la soumission
                      Navigator.of(context).pop();
                    },
                    decoration: InputDecoration(
                        // Espacement interne du texte
                        contentPadding: const EdgeInsets.only(bottom: 5),
                        filled: true,
                        // Utilise la couleur de niveau 2 du thème
                        fillColor: viewModel.clrLvl2,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            // Bordure invisible
                            borderSide: const BorderSide(
                                width: 0, style: BorderStyle.none))),
                    // Centre le texte horizontalement et verticalement
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    // Utilise la couleur de niveau 4 pour le curseur
                    cursorColor: viewModel.clrLvl4,
                    // Active le focus automatiquement au démarrage
                    autofocus: true,
                    // Désactive la correction automatique
                    autocorrect: false,
                    // Lie le contrôleur au champ de texte
                    controller: entryController,
                    // Style du texte avec la couleur de niveau 4
                    style: TextStyle(
                        color: viewModel.clrLvl4, fontWeight: FontWeight.w500)),
              ),
            ),
          ),
        );
      },
    );
  }
}
