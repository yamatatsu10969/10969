import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../styles/design_size.dart';
import '../../widgets/tap_to_unfocus_view.dart';

class AccountsPage extends HookConsumerWidget {
  const AccountsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TapToUnfocusView(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: DesignSize.m),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              rowItem(
                // Image.asset('assets/profiles/taka.jpg'),
                const AspectRatio(
                  aspectRatio: 1,
                  child: Placeholder(),
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.center,
                  children: const [
                    SNSButton(
                      sns: SNS.instagram,
                      urlPath: 'oneokrockofficial/',
                    ),
                    SNSButton(
                      sns: SNS.youtube,
                      urlPath: 'user/ONEOKROCKchannel/',
                    ),
                    SNSButton(
                      sns: SNS.tiktok,
                      urlPath: '@oneokrock_official',
                    ),
                    SNSButton(
                      sns: SNS.facebook,
                      urlPath: 'ONEOKROCK',
                    ),
                    SNSButton(
                      sns: SNS.twitter,
                      urlPath: 'ONEOKROCK_japan',
                    ),
                    SNSButton(
                      sns: SNS.web,
                      urlPath: '',
                    ),
                    SNSButton(
                      sns: SNS.spotify,
                      urlPath: '7k73EtZwoPs516ZxE72KsO',
                    ),
                    SNSButton(
                      sns: SNS.apple,
                      urlPath: '',
                    ),
                  ],
                ),
              ),
              rowItem(
                const SNSButton(sns: SNS.instagram, urlPath: '10969taka/'),
                const AspectRatio(
                  aspectRatio: 1,
                  child: Placeholder(),
                ),
              ),
              rowItem(
                const AspectRatio(
                  aspectRatio: 1,
                  child: Placeholder(),
                ),
                const SNSButton(sns: SNS.instagram, urlPath: 'toru_10969/'),
              ),
              rowItem(
                const SNSButton(sns: SNS.instagram, urlPath: 'ryota_0809/'),
                const AspectRatio(
                  aspectRatio: 1,
                  child: Placeholder(),
                ),
              ),
              rowItem(
                const AspectRatio(
                  aspectRatio: 1,
                  child: Placeholder(),
                ),
                Wrap(
                  children: const [
                    SNSButton(sns: SNS.instagram, urlPath: 'tomo_10969/'),
                    SNSButton(
                      sns: SNS.youtube,
                      urlPath: 'channel/UCWnAmpRn-ahaCt7kmsPSGRw',
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget rowItem(Widget left, Widget right) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Center(child: left)),
        Expanded(child: Center(child: right)),
      ],
    );
  }

  Widget instagramButton(String url) {
    return IconButton(
      icon: const FaIcon(FontAwesomeIcons.instagram),
      onPressed: () {
        launchUrlString(url, mode: LaunchMode.externalApplication);
      },
    );
  }
}

class SNSButton extends StatelessWidget {
  const SNSButton({
    super.key,
    required this.sns,
    required this.urlPath,
  });

  final SNS sns;
  final String urlPath;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: sns.icon,
      onPressed: () async {
        final url = sns.baseUrl + urlPath;
        if (await canLaunchUrlString(url)) {
          await launchUrlString(url, mode: LaunchMode.externalApplication);
        }
        // TODO(yamatatsu): エラー表示
      },
    );
  }
}

enum SNS {
  instagram(
    baseUrl: 'https://www.instagram.com/',
    icon: FaIcon(FontAwesomeIcons.instagram),
  ),
  youtube(
    baseUrl: 'https://www.youtube.com/',
    icon: FaIcon(FontAwesomeIcons.youtube),
  ),
  facebook(
    baseUrl: 'https://www.youtube.com/',
    icon: FaIcon(FontAwesomeIcons.facebookF),
  ),
  tiktok(
    baseUrl: 'https://www.tiktok.com/',
    icon: FaIcon(FontAwesomeIcons.tiktok),
  ),
  spotify(
    baseUrl: 'https://play.spotify.com/artist/',
    icon: FaIcon(FontAwesomeIcons.spotify),
  ),
  apple(
    // TODO(yamatatsu): url 修正
    baseUrl: 'http://smarturl.it/ONEOKROCK',
    icon: FaIcon(FontAwesomeIcons.apple),
  ),
  twitter(
    baseUrl: 'https://twitter.com/',
    icon: FaIcon(FontAwesomeIcons.twitter),
  ),
  web(
    // TODO(yamatatsu): 日本語どうする
    baseUrl: 'https://www.oneokrock.com/en/',
    // TODO(yamatatsu): 骨のアイコンにしたい
    icon: FaIcon(FontAwesomeIcons.heartBroken),
  );

  const SNS({
    required this.baseUrl,
    required this.icon,
  });

  final String baseUrl;
  final Widget icon;
}
