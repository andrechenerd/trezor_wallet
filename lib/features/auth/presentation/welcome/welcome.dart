import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trezor_wallet_desktop/app_data/app_data.dart';

import '../../../widgets/custom_elevated_button.dart';
import 'welcome_bloc.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends WelcomeBloc {
  Widget get header {
    switch (selectedScreen) {
      case 0:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "All data collected",
                  style: AppData.theme.text.s14w600,
                ),
                const SizedBox(height: 23),
                Text(
                  "All data collected is anorymous and is used to improve product performance and development. More in technical documentation and Terms & Conditions.",
                  style: AppData.theme.text.s14w500.copyWith(
                    color: AppData.colors.basicGray,
                  ),
                  maxLines: 2,
                  softWrap: true,
                ),
                const SizedBox(height: 36),
                DropdownButton<String>(
                  isExpanded: true,
                  underline: const SizedBox(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  value: dropdownValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: dropdownMenu
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: AppData.theme.text.s14w600.copyWith(
                          color: AppData.colors.basicGray,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 36),
                Row(
                  children: [
                    Switch(
                      activeTrackColor: AppData.colors.mainGreenColor,
                      inactiveTrackColor: Colors.grey,
                      value: isCheckBox,
                      onChanged: (value) => setState(() {
                        isCheckBox = !isCheckBox;
                      }),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      "Allow anonymous data collection",
                      style: AppData.theme.text.s12w500,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 36),
            SizedBox(
              width: 160,
              child: CustomElevatedButton(
                text: "Confirm",
                onPress: () => setState(() {
                  selectedScreen++;
                }),
              ),
            ),
          ],
        );
      case 1:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "All data collected",
                  style: AppData.theme.text.s14w600,
                ),
                const SizedBox(height: 23),
                Text(
                  "All data collected is anorymous and is used to improve product performance and development. More in technical documentation and Terms & Conditions.",
                  style: AppData.theme.text.s14w500.copyWith(
                    color: AppData.colors.basicGray,
                  ),
                  maxLines: 2,
                  softWrap: true,
                ),
                const SizedBox(height: 36),
                DropdownButton<String>(
                  isExpanded: true,
                  underline: const SizedBox(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  value: dropdownValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: dropdownMenu
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: AppData.theme.text.s14w600.copyWith(
                          color: AppData.colors.basicGray,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 28),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Platform",
                          style: AppData.theme.text.s14w600.copyWith(
                            color: AppData.colors.basicGray,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "OS, Trezor model, version etc.",
                          style: AppData.theme.text.s14w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 26),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Usage",
                          style: AppData.theme.text.s14w600.copyWith(
                            color: AppData.colors.basicGray,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "How you use Suite",
                          style: AppData.theme.text.s14w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 26),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Audience",
                          style: AppData.theme.text.s14w600.copyWith(
                            color: AppData.colors.basicGray,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Language, user count, etc.",
                          style: AppData.theme.text.s14w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 36),
                Row(
                  children: [
                    Switch(
                      activeTrackColor: AppData.colors.mainGreenColor,
                      inactiveTrackColor: Colors.grey,
                      value: isCheckBox,
                      onChanged: (value) => setState(() {
                        isCheckBox = !isCheckBox;
                      }),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      "Allow anonymous data collection",
                      style: AppData.theme.text.s12w500,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 36),
            SizedBox(
              width: 160,
              child: CustomElevatedButton(
                text: "Confirm",
                onPress: () => setState(() {
                  selectedScreen++;
                }),
              ),
            ),
          ],
        );
      case 2:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Recovery wallet",
              style: AppData.theme.text.s20w700,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: 380,
              child: Text(
                "Have you used a TREZOR before?\nOwn a recovery seed from a different wallet or app?\nSimply restore the wallet from your backup.",
                style: AppData.theme.text.s14w600
                    .copyWith(color: AppData.colors.basicGray),
                maxLines: 3,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 36),
            SizedBox(
              width: 250,
              child: CustomElevatedButton(
                text: "Recovery wallet",
                onPress: () => context.go(AppData.routes.importKeyScreen),
              ),
            ),
          ],
        );

      default:
        return Container();
    }
  }

  Widget get body {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppData.assets.image.trezor(),
              const SizedBox(height: 32),
              AppData.assets.image.welcome(),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: header,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: body,
      ),
    );
  }
}
