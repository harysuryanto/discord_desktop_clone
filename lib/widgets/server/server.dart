import 'package:fluent_ui/fluent_ui.dart';

import 'server_list_tile.dart';

class Server extends StatelessWidget {
  const Server({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxWidth: 72,
      child: ListView(
        controller: ScrollController(),
        children: const [
          SizedBox(height: 12),
          ServerListTile(serverName: 'Home'),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          ServerListTile(
              serverName: 'RPL-B Squad',
              imageUrl:
                  'https://cdn.discordapp.com/icons/757200769819869226/f3cf101df6b34c91997101438e56c072.webp?size=96',
              isActive: true),
          SizedBox(height: 10),
          ServerListTile(
              serverName: 'DSE-C Prak. Mobile',
              imageUrl:
                  'https://cdn.discordapp.com/icons/690454124809945130/03640d6c24bbc25be422c3d4b56306f9.webp?size=80'),
          SizedBox(height: 10),
          ServerListTile(serverName: 'Pisang'),
          SizedBox(height: 10),
          ServerListTile(
            serverName: 'Add',
            isAnActionButton: true,
            tooltipMessage: 'Add a Server',
          ),
          SizedBox(height: 10),
          ServerListTile(
            serverName: 'Explore',
            isAnActionButton: true,
            tooltipMessage: 'Explore Public Servers',
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
