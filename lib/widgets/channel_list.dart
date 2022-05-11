import 'package:discord_desktop_clone/colors.dart';
import 'package:discord_desktop_clone/widgets/avatar_with_online_status.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChannelList extends StatelessWidget {
  const ChannelList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
      ),
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        width: 240,
        child: Container(
          color: grey3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              FaIcon(FontAwesomeIcons.hashtag),
                              SizedBox(width: 10),
                              Text('ngobrol-santai')
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                  icon: const Icon(FluentIcons.add_friend),
                                  onPressed: () {}),
                              IconButton(
                                  icon: const Icon(FluentIcons.settings),
                                  onPressed: () {}),
                            ],
                          )
                        ],
                      ),
                    ),
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
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              FaIcon(FontAwesomeIcons.volumeHigh),
                              SizedBox(width: 10),
                              Text('ngobrol-santai')
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(12),
                color: grey2,
                child: Row(children: [
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
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
