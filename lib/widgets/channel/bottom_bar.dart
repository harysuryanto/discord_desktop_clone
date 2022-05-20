import 'package:discord_desktop_clone/widgets/channel/custom_tooltip.dart';
import 'package:fluent_ui/fluent_ui.dart';

import '../../utils/colors.dart';
import '../global/avatar_with_online_status.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(12),
      color: backgroundSecondaryAlt,
      child: Row(
        children: [
          const AvatarWithOnlineStatus(
            imageUrl:
                'https://cdn.discordapp.com/avatars/871388221836251166/04fa62bc9241e82f1587328146d448d7.webp?size=32',
            username: 'Hary Suryanto',
            isOnline: true,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ClickToCopy(
              textToCopy: 'King Jom-Uh#6969',
              description: 'Click to copy username',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'King Jom-Uh',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '#6969',
                    style: TextStyle(color: headerSecondary, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
              icon: const Icon(FluentIcons.microphone), onPressed: () {}),
          IconButton(icon: const Icon(FluentIcons.speakers), onPressed: () {}),
          IconButton(icon: const Icon(FluentIcons.settings), onPressed: () {}),
        ],
      ),
    );
  }
}
