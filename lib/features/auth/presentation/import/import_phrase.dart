import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trezor_wallet_desktop/features/widgets/custom_elevated_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../app_data/app_data.dart';
import 'import_bloc.dart';

class ImportKeyScreen extends StatefulWidget {
  const ImportKeyScreen({super.key});

  @override
  State<ImportKeyScreen> createState() => _YourSecretPhraseScreenState();
}

class _YourSecretPhraseScreenState extends ImportBloc {
  Widget get header {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: importStage > 0
                    ? AppData.colors.mainGreenColor
                    : Colors.transparent,
                radius: 16,
                child: Text(
                  "1",
                  style: importStage > 0
                      ? AppData.theme.text.s12w600.copyWith(color: Colors.white)
                      : AppData.theme.text.s12w600,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                "Recover your wallet",
                style: AppData.theme.text.s12w600,
              )
            ],
          ),
          Icon(
            Icons.navigate_next,
            color: AppData.colors.basicGray,
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: importStage > 1
                    ? AppData.colors.mainGreenColor
                    : Colors.transparent,
                radius: 16,
                child: Text(
                  "2",
                  style: importStage > 1
                      ? AppData.theme.text.s12w600.copyWith(color: Colors.white)
                      : AppData.theme.text.s12w600,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                "Passphrase",
                style: AppData.theme.text.s12w600,
              )
            ],
          ),
          Icon(
            Icons.navigate_next,
            color: AppData.colors.basicGray,
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: importStage > 2
                    ? AppData.colors.mainGreenColor
                    : Colors.transparent,
                radius: 16,
                child: Text(
                  "3",
                  style: importStage > 2
                      ? AppData.theme.text.s12w600.copyWith(color: Colors.white)
                      : AppData.theme.text.s12w600,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                "Type seed words",
                style: AppData.theme.text.s12w600,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget get headerProgressLine {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            height: 2,
            color: importStage > 0
                ? AppData.colors.mainGreenColor
                : Colors.transparent,
          ),
        ),
        CircleAvatar(
          radius: 5,
          backgroundColor: importStage > 0
              ? AppData.colors.mainGreenColor
              : Colors.transparent,
        ),
        Expanded(
          flex: 4,
          child: Container(
            height: 2,
            color: importStage > 1
                ? AppData.colors.mainGreenColor
                : Colors.transparent,
          ),
        ),
        CircleAvatar(
          radius: 5,
          backgroundColor: importStage > 1
              ? AppData.colors.mainGreenColor
              : Colors.transparent,
        ),
        Expanded(
          flex: 4,
          child: Container(
            height: 2,
            color: importStage > 2
                ? AppData.colors.mainGreenColor
                : Colors.transparent,
          ),
        ),
        CircleAvatar(
          radius: 5,
          backgroundColor: importStage > 2
              ? AppData.colors.mainGreenColor
              : Colors.transparent,
        ),
        Expanded(
          flex: 4,
          child: Container(
            height: 2,
            color: importStage > 2
                ? AppData.colors.mainGreenColor
                : Colors.transparent,
          ),
        ),
      ],
    );
  }

  Widget get head {
    return Column(
      children: [
        header,
        headerProgressLine,
      ],
    );
  }

  Widget get buttons {
    switch (importStage) {
      case 3:
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: importStage > 1
                    ? () => setState(() {
                          importStage--;
                        })
                    : null,
                child: SizedBox(
                  width: 170,
                  height: 40,
                  child: Center(
                    child: Text(
                      "Go Back",
                      style: AppData.theme.text.s16w500,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 220,
              child: CustomElevatedButton(
                text: isLoading ? "Loading..." : "Recover wallet",
                onPress: toCheckKey && !isLoading ? toDone : null,
              ),
            ),
          ],
        );
      case 1:
      case 2:
      default:
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: importStage > 1
                    ? () => setState(() {
                          importStage--;
                        })
                    : null,
                child: SizedBox(
                  width: 170,
                  height: 40,
                  child: Center(
                    child: Text(
                      "Go Back",
                      style: AppData.theme.text.s16w500,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 170,
              child: CustomElevatedButton(
                text: "Continue",
                onPress: () => setState(() {
                  importStage++;
                }),
              ),
            ),
          ],
        );
    }
  }

  Widget get importStageBody {
    switch (importStage) {
      case 1:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recover your wallet",
              style: AppData.theme.text.s14w600,
            ),
            const SizedBox(height: 24),
            Text(
              "Number of words in your recovery seed",
              style: AppData.theme.text.s14w500.copyWith(
                color: AppData.colors.basicGray,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => setState(() {
                      countWords = 12;
                      controllers = List.generate(
                        12,
                        (index) => TextEditingController(),
                      );
                      focusNode = List.generate(
                        12,
                        (index) => FocusNode(),
                      );
                    }),
                    child: Container(
                      decoration: countWords == 12
                          ? BoxDecoration(
                              color: AppData.colors.mainGreenColor,
                              borderRadius: BorderRadius.circular(6),
                            )
                          : null,
                      width: 170,
                      height: 40,
                      child: Center(
                        child: Text(
                          "12 words",
                          style: countWords == 12
                              ? AppData.theme.text.s16w500
                                  .copyWith(color: Colors.white)
                              : AppData.theme.text.s16w500,
                        ),
                      ),
                    ),
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => setState(() {
                      countWords = 18;
                      controllers = List.generate(
                        18,
                        (index) => TextEditingController(),
                      );
                      focusNode = List.generate(
                        18,
                        (index) => FocusNode(),
                      );
                    }),
                    child: Container(
                      decoration: countWords == 18
                          ? BoxDecoration(
                              color: AppData.colors.mainGreenColor,
                              borderRadius: BorderRadius.circular(6),
                            )
                          : null,
                      width: 170,
                      height: 40,
                      child: Center(
                        child: Text(
                          "18 words",
                          style: countWords == 18
                              ? AppData.theme.text.s16w500
                                  .copyWith(color: Colors.white)
                              : AppData.theme.text.s16w500,
                        ),
                      ),
                    ),
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => setState(() {
                      countWords = 24;
                      controllers = List.generate(
                        24,
                        (index) => TextEditingController(),
                      );
                      focusNode = List.generate(
                        24,
                        (index) => FocusNode(),
                      );
                    }),
                    child: Container(
                      decoration: countWords == 24
                          ? BoxDecoration(
                              color: AppData.colors.mainGreenColor,
                              borderRadius: BorderRadius.circular(6),
                            )
                          : null,
                      width: 170,
                      height: 40,
                      child: Center(
                        child: Text(
                          "24 words",
                          style: countWords == 24
                              ? AppData.theme.text.s16w500
                                  .copyWith(color: Colors.white)
                              : AppData.theme.text.s16w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                "Advanced recovery",
                style: AppData.theme.text.s12w500,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "Advanced recovery uses on-screen input to load your recovery seed, ",
                  style: AppData.theme.text.s14w500.copyWith(
                    color: AppData.colors.basicGray,
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () async {
                      final Uri url = Uri.parse('https://iancoleman.io/bip39/');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Center(
                              child: Text(
                                "Could not launch $url",
                                style: AppData.theme.text.s14w500.copyWith(
                                  color: AppData.colors.basicGray,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Lear more",
                      style: AppData.theme.text.s12w500
                          .copyWith(color: AppData.colors.mainGreenColor),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      case 2:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recover your wallet",
              style: AppData.theme.text.s14w600,
            ),
            const SizedBox(height: 24),
            Text(
              "Passphrase",
              style: AppData.theme.text.s14w500.copyWith(
                color: AppData.colors.basicGray,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Please check the checkbox if you have used a passphrase before. You need to enable this feature to access your funds protected by your passphrase. You can also keep the box unchecked and enable the feature later in device settings.",
              style: AppData.theme.text.s14w500.copyWith(
                color: AppData.colors.basicGray,
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 42),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                "I used passphrase before",
                style: AppData.theme.text.s12w600,
              ),
            ),
          ],
        );
      case 3:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Enter word list",
                  style: AppData.theme.text.s14w600,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () async {
                      ClipboardData? clipboardData =
                          await Clipboard.getData(Clipboard.kTextPlain);
                      if (clipboardData != null) {
                        List<String> words = clipboardData.text!.split(" ");
                        controllers.clear();
                        controllers = List.generate(
                          countWords,
                          (index) => TextEditingController(),
                        );
                        for (int i = 0; i < words.length; i++) {
                          if (i + 1 > countWords) {
                            break;
                          }
                          setState(() {
                            controllers[i].text = words[i];
                          });
                        }
                      }
                    },
                    child: Text(
                      "Paste",
                      style: AppData.theme.text.s14w600
                          .copyWith(color: AppData.colors.mainGreenColor),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 4 / 1,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: controllers[index].text.isEmpty
                            ? Colors.transparent
                            : AppData.colors.mainGreenColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "${index + 1}.",
                          style: AppData.theme.text.s14w600,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            focusNode: focusNode[index],
                            onEditingComplete: () {
                              if (focusNode.last != focusNode[index]) {
                                FocusScope.of(context)
                                    .requestFocus(focusNode[index + 1]);
                              }
                            },
                            onChanged: (value) {
                              setState(() {
                                controllers[index].text = value;
                              });
                              if (controllers[index].text.isEmpty &&
                                  focusNode.first != focusNode[index]) {
                                FocusScope.of(context)
                                    .requestFocus(focusNode[index - 1]);
                              }
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[a-zA-Z]')),
                            ],
                            style: AppData.theme.text.s14w400,
                            controller: controllers[index],
                            decoration: null,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: countWords,
              ),
            ),
          ],
        );
      default:
        return const Column();
    }
  }

  Widget get body {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        head,
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: importStageBody,
          ),
        ),
        const SizedBox(height: 24),
        buttons,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 800,
              height: 600,
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: body,
            ),
          ],
        ),
      ),
    );
  }
}
