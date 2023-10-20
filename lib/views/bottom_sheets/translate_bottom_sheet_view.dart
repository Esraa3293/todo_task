import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_task/view_models/app_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TranslateBottomSheetView extends StatelessWidget {
  const TranslateBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return SizedBox(
          height: 125,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  viewModel.changeLanguage("en");
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: viewModel.primary,
                    backgroundColor: viewModel.secondary,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Text(AppLocalizations.of(context)!.english),
              ),
              const SizedBox(
                width: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  viewModel.changeLanguage("ar");
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: viewModel.primary,
                    backgroundColor: viewModel.secondary,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Text(AppLocalizations.of(context)!.arabic),
              ),
            ],
          ),
        );
      },
    );
  }
}
