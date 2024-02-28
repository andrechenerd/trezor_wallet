import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app_data/app_data.dart';
import 'import_phrase.dart';

abstract class ImportBloc extends State<ImportKeyScreen> {
  List<TextEditingController> controllers = List.generate(
    12,
    (index) => TextEditingController(),
  );

  List<FocusNode> focusNode = List.generate(
    12,
    (index) => FocusNode(),
  );

  bool arraysEqual = false;
  bool isLoading = false;

  int importStage = 1;

  int countWords = 12;

  bool get toCheckKey {
    for (int i = 0; i < countWords; i++) {
      if (controllers[i].text.isEmpty) {
        print("empty");
        setState(() {
          arraysEqual = false;
        });
        return arraysEqual;
      }
    }
    print("notEmpty");
    setState(() {
      arraysEqual = true;
    });

    return arraysEqual;
  }

  Future<void> toDone() async {
    setState(() {
      isLoading = true;
    });
    String combinedText =
        controllers.map((controller) => controller.text).join(" ");
    final res = await AppData.utils.importData(
      public: combinedText,
      isNew: false,
    );
    if (res && mounted) {
      context.go(
        AppData.routes.statusScreen,
        extra: true,
      );
    } else if (mounted) {
      context.go(
        AppData.routes.statusScreen,
        extra: false,
      );
    }
    setState(() {
      isLoading = false;
    });
  }
}
