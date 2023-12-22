import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../gen/assets.gen.dart';
import '../../widgets/tap_to_unfocus_view.dart';
import '../accounts/accounts_page.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TapToUnfocusView(
      child: SafeArea(
        child: Scaffold(
          body: SettingsList(
            darkTheme: const SettingsThemeData(),
            lightTheme: const SettingsThemeData(),
            applicationType: ApplicationType.cupertino,
            sections: [
              SettingsSection(
                title: const Text(
                  'Settings',
                ),
                tiles: [
                  SettingsTile.switchTile(
                    initialValue: false,
                    enabled: false,
                    onToggle: (value) {},
                    leading: const Icon(Icons.language),
                    title: const Text('Japaneses\n(Coming Soon...)'),
                  ),
                ],
              ),
              SettingsSection(
                title: const Text(
                  'Others',
                ),
                tiles: [
                  SettingsTile.navigation(
                    title: const Text('Privacy Policy'),
                    onPressed: (_) => launchUrlString(
                      'https://github.com/yamatatsu10969/10969/blob/main/documents/privacy_policy.md',
                    ),
                  ),
                  SettingsTile.navigation(
                    title: const Text('Created by'),
                    onPressed: (_) => showDialog<void>(
                      context: context,
                      builder: (dialogContext) => AlertDialog(
                        title: const Text('Created by'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('yamatatsu'),
                            Wrap(
                              children: [
                                IconButton(
                                  onPressed: () => launchUrlString(
                                    'https://twitter.com/yamatatsu109_ja',
                                  ),
                                  icon: SNS.twitter.icon,
                                ),
                                IconButton(
                                  onPressed: () => launchUrlString(
                                    'https://www.instagram.com/yamatatsu10969/',
                                  ),
                                  icon: SNS.instagram.icon,
                                ),
                                IconButton(
                                  onPressed: () => launchUrlString(
                                    'https://github.com/yamatatsu10969',
                                  ),
                                  icon: SNS.github.icon,
                                ),
                              ],
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(dialogContext),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SettingsTile.navigation(
                    title: const Text('About App'),
                    onPressed: (_) {
                      final packageInfo = ref.watch(packageInfoProvider);
                      showAboutDialog(
                        context: context,
                        applicationName: packageInfo.appName,
                        applicationVersion: 'Version: ${packageInfo.version}',
                        applicationIcon: Padding(
                          padding: const EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Assets.launcherIcons.iconProd.image(
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ),
                        applicationLegalese: 'Copyright © 2022 yamatatsu',
                      );
                    },
                  ),
                  SettingsTile(
                    enabled: false,
                    title: const Text(
                      'This app is not related ONE OK ROCK official.',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget item(String title, {void Function()? onTap}) {
    return ListTile(
      title: Text(title),
      trailing: onTap == null ? null : const Icon(Icons.chevron_right_rounded),
      tileColor: Colors.white,
      onTap: onTap,
    );
  }
}

final packageInfoProvider = Provider<PackageInfo>(
  (ref) => throw UnimplementedError(),
);
