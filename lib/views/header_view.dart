import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_task/view_models/app_view_model.dart';
import 'package:todo_task/views/bottom_sheets/delete_bottom_sheet_view.dart';
import 'package:todo_task/views/bottom_sheets/settings_bottom_sheet_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'bottom_sheets/translate_bottom_sheet_view.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return Row(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              "${AppLocalizations.of(context)!.welcomeMessage},",
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w400,
                                  color: viewModel.onSecondary),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              viewModel.username,
                              style: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.bold,
                                  color: viewModel.onSecondary),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: IconButton(
                    onPressed: () {
                      viewModel.bottomSheetBuilder(
                          const DeleteBottomSheetView(), context);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: viewModel.secondary,
                      size: 40,
                    ))),
            Expanded(
                flex: 1,
                child: IconButton(
                    onPressed: () {
                      viewModel.bottomSheetBuilder(
                          const SettingsBottomSheetView(), context);
                    },
                    icon: Icon(
                      Icons.settings,
                      color: viewModel.secondary,
                      size: 40,
                    ))),
            Expanded(
                flex: 1,
                child: IconButton(
                    onPressed: () {
                      viewModel.bottomSheetBuilder(
                          const TranslateBottomSheetView(), context);
                    },
                    icon: Icon(
                      Icons.translate,
                      color: viewModel.secondary,
                      size: 40,
                    ))),
          ],
        );
      },
    );
  }
}
