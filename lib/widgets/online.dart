import 'package:discord_desktop_clone/colors.dart';
import 'package:discord_desktop_clone/widgets/online_list_tile.dart';
import 'package:fluent_ui/fluent_ui.dart';

class Online extends StatelessWidget {
  const Online({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      color: grey3,
      child: ListView(
        controller: ScrollController(),
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('ONLINE — 2'),
                SizedBox(height: 10),
                OnlineListTile(
                  imageUrl:
                      'https://cdn.discordapp.com/avatars/653186965474377737/de05515d03b7202a568d0281460c0b41.webp?size=80',
                  username: 'Dicka',
                  activity: 'Mancing',
                ),
                SizedBox(height: 10),
                OnlineListTile(
                  imageUrl:
                      'https://cdn.discordapp.com/avatars/449940864576258049/28cf51b9af6e5a38c187ee13b8019b7d.webp?size=80',
                  username: 'Ganteng9',
                  activity: 'Playing War Thunder',
                ),
                SizedBox(height: 10),
                OnlineListTile(
                  username: 'Hary Suryanto',
                ),
                SizedBox(height: 10),
                OnlineListTile(
                  imageUrl:
                      'https://cdn.discordapp.com/avatars/871388221836251166/04fa62bc9241e82f1587328146d448d7.webp?size=32',
                  username: 'King Jom-Uy',
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('OFFLINE — 23'),
                SizedBox(height: 10),
                OnlineListTile(
                  imageUrl:
                      'https://cdn.discordapp.com/avatars/653186965474377737/de05515d03b7202a568d0281460c0b41.webp?size=80',
                  username: 'Dicka',
                  activity: 'Mancing',
                  isOnline: false,
                ),
                SizedBox(height: 10),
                OnlineListTile(
                  imageUrl:
                      'https://cdn.discordapp.com/avatars/449940864576258049/28cf51b9af6e5a38c187ee13b8019b7d.webp?size=80',
                  username: 'Ganteng9',
                  activity: 'Playing War Thunder',
                  isOnline: false,
                ),
                SizedBox(height: 10),
                OnlineListTile(
                  imageUrl:
                      'https://cdn.discordapp.com/avatars/653186965474377737/de05515d03b7202a568d0281460c0b41.webp?size=80',
                  username: 'Dicka',
                  activity: 'Mancing',
                  isOnline: false,
                ),
                SizedBox(height: 10),
                OnlineListTile(
                  imageUrl:
                      'https://cdn.discordapp.com/avatars/449940864576258049/28cf51b9af6e5a38c187ee13b8019b7d.webp?size=80',
                  username: 'Ganteng9',
                  activity: 'Playing War Thunder',
                  isOnline: false,
                ),
                SizedBox(height: 10),
                OnlineListTile(
                  imageUrl:
                      'https://cdn.discordapp.com/avatars/653186965474377737/de05515d03b7202a568d0281460c0b41.webp?size=80',
                  username: 'Dicka',
                  activity: 'Mancing',
                  isOnline: false,
                ),
                SizedBox(height: 10),
                OnlineListTile(
                  imageUrl:
                      'https://cdn.discordapp.com/avatars/449940864576258049/28cf51b9af6e5a38c187ee13b8019b7d.webp?size=80',
                  username: 'Ganteng9',
                  activity: 'Playing War Thunder',
                  isOnline: false,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
