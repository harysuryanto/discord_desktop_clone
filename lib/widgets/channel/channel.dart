import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../colors.dart';
import '../global/avatar_with_online_status.dart';

class Channel extends StatelessWidget {
  const Channel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      decoration: const BoxDecoration(
        color: grey3,
        borderRadius: BorderRadius.only(
          topLeft: kIsWeb ? Radius.circular(0) : Radius.circular(10),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('RPL-B Squad',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                IconButton(
                    icon: const Icon(FluentIcons.chevron_down),
                    onPressed: () {})
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView(
              children: [
                const SizedBox(height: 10),

                /// Text channels
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              FaIcon(FontAwesomeIcons.chevronDown),
                              SizedBox(width: 10),
                              Text('TEXT CHANNELS')
                            ],
                          ),
                          IconButton(
                              icon: const Icon(FontAwesomeIcons.plus),
                              onPressed: () {})
                        ],
                      ),
                      _buildTextChannelItem(name: 'ngobrol-santai'),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                /// Voice channels
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              FaIcon(FontAwesomeIcons.chevronDown),
                              SizedBox(width: 10),
                              Text('VOICE CHANNELS')
                            ],
                          ),
                          IconButton(
                              icon: const Icon(FontAwesomeIcons.plus),
                              onPressed: () {})
                        ],
                      ),
                      _buildVoiceChannelItem(name: 'General'),
                      const SizedBox(height: 10),
                      _buildVoiceChannelItem(name: 'PUBG-Only'),
                      const SizedBox(height: 10),
                      _buildVoiceChannelItem(name: 'War Thunder-Only'),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(12),
            color: grey2,
            child: Row(
              children: [
                const AvatarWithOnlineStatus(
                  imageUrl:
                      'https://cdn.discordapp.com/avatars/871388221836251166/04fa62bc9241e82f1587328146d448d7.webp?size=32',
                  username: 'Hary Suryanto',
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'King Jom-Uh',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text('#6969'),
                    ],
                  ),
                ),
                IconButton(
                    icon: const Icon(FluentIcons.mic_off2), onPressed: () {}),
                IconButton(
                    icon: const Icon(FluentIcons.speakers), onPressed: () {}),
                IconButton(
                    icon: const Icon(FluentIcons.settings), onPressed: () {}),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTextChannelItem({Key? key, required String name}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const FaIcon(FontAwesomeIcons.hashtag),
              const SizedBox(width: 10),
              Text(name),
            ],
          ),
          Row(
            children: [
              IconButton(
                  icon: const Icon(FluentIcons.add_friend), onPressed: () {}),
              IconButton(
                  icon: const Icon(FluentIcons.settings), onPressed: () {}),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildVoiceChannelItem({Key? key, required String name}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const FaIcon(FontAwesomeIcons.volumeHigh),
              const SizedBox(width: 10),
              Text(name),
            ],
          ),
        ],
      ),
    );
  }
}
