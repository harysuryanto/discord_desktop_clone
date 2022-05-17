import 'package:fluent_ui/fluent_ui.dart';

import 'server_list_tile.dart';

class Server extends StatelessWidget {
  const Server({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      child: ListView(
        controller: ScrollController(),
        padding: const EdgeInsets.all(12),
        children: const [
          ServerListTile(
              serverName: 'Home',
              imageUrl: 'https://i.ibb.co/4sg5gnR/Discord-Logo-White.png'),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          ServerListTile(serverName: 'Pisang'),
          SizedBox(height: 10),
          ServerListTile(
              serverName: 'RPL-B Squad',
              imageUrl:
                  'https://cdn.discordapp.com/icons/757200769819869226/f3cf101df6b34c91997101438e56c072.webp?size=96'),
          SizedBox(height: 10),
          ServerListTile(serverName: 'add', isAnActionButton: true),
          SizedBox(height: 10),
          ServerListTile(serverName: 'explore', isAnActionButton: true),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
