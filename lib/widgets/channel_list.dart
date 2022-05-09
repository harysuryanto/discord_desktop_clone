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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Text('RPL-B Squad'),
              ),
              const Divider(),
              const Spacer(),
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(12),
                color: grey2,
                child: Row(children: [
                  CircleAvatar(backgroundColor: Colors.yellow, radius: 16),
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
