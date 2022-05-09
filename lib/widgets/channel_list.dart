import 'package:discord_desktop_clone/colors.dart';
import 'package:fluent_ui/fluent_ui.dart';

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
        width: 250,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('> TEXT CHANNELS'),
                        IconButton(
                            icon: const Icon(FluentIcons.add), onPressed: () {})
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('# ngobrol-santai'),
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
              const Spacer(),
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(12),
                color: grey2,
                child: Row(children: [
                  Stack(
                    children: [
                      CircleAvatar(backgroundColor: Colors.yellow, radius: 16),
                      const Positioned(
                        bottom: -3,
                        right: -3,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor: grey2,
                          child: CircleAvatar(
                            radius: 4,
                            backgroundColor: green,
                          ),
                        ),
                      ),
                    ],
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
