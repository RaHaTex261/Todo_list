import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/view_models/app_view_model.dart';
import 'package:todo_list/views/bottom_sheets/delete_bottom_sheet_view.dart';
import 'package:todo_list/views/bottom_sheets/settings_bottom_sheet_view.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: viewModel.clrLvl2,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          child: Row(
            children: [
              // Section utilisateur
              Expanded(
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Bienvenu :',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: viewModel.clrLvl4,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        viewModel.username,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: viewModel.clrLvl4,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ),

              // Boutons d'action
              Row(
                children: [
                  // Bouton de suppression
                  _ActionIconButton(
                    icon: Icons.delete,
                    color: viewModel.clrLvl3,
                    onPressed: () {
                      HapticFeedback.mediumImpact();
                      viewModel.bottomSheetBuilder(
                        const DeleteBottomSheetView(),
                        context,
                      );
                    },
                  ),
                  const SizedBox(width: 12),
                  // Bouton de paramètres
                  _ActionIconButton(
                    icon: Icons.settings,
                    color: viewModel.clrLvl3,
                    onPressed: () {
                      HapticFeedback.mediumImpact();
                      viewModel.bottomSheetBuilder(
                        const SettingsBottomSheetView(),
                        context,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ActionIconButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const _ActionIconButton({
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          size: 28,
          color: color,
        ),
      ),
    );
  }
}
