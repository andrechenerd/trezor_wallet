import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:trezor_wallet_desktop/app_data/app_data.dart';
import 'package:trezor_wallet_desktop/features/widgets/custom_elevated_button.dart';

import 'status_bloc.dart';

class StatusScreen extends StatefulWidget {
  final bool status;
  const StatusScreen({
    super.key,
    required this.status,
  });

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends StatusBloc {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.status
              ? [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: AppData.colors.mainGreenColor,
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    "Your wallet is imported",
                    style: AppData.theme.text.s32w400,
                  ),
                  const SizedBox(height: 80),
                  SizedBox(
                    width: 200,
                    child: CustomElevatedButton(
                      text: "Ok",
                      onPress: () => context.go(AppData.routes.welcomeScreen),
                    ),
                  ),
                ]
              : [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: AppData.colors.red040,
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    "Your wallet is not imported",
                    style: AppData.theme.text.s32w400,
                  ),
                  const SizedBox(height: 80),
                  SizedBox(
                    width: 200,
                    child: CustomElevatedButton(
                      text: "Ok",
                      onPress: () => context.go(AppData.routes.importKeyScreen),
                    ),
                  ),
                ],
        ),
      ),
    );
  }
}
