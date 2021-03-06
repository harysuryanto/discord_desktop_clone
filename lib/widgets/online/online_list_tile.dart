import '../../utils/colors.dart';
import 'package:fluent_ui/fluent_ui.dart';

import '../global/avatar_with_online_status.dart';

class OnlineListTile extends StatelessWidget {
  const OnlineListTile({
    Key? key,
    this.imageUrl,
    required this.username,
    this.activity,
    this.isOnline = true,
    this.isAdmin = false,
  }) : super(key: key);

  final String? imageUrl;
  final String username;
  final String? activity;
  final bool isOnline;
  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isOnline ? 1 : 0.3,
      child: Row(
        children: [
          AvatarWithOnlineStatus(
            username: username,
            imageUrl: imageUrl,
            isOnline: isOnline,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: TextStyle(
                      color: isAdmin ? adminName : channelsDefault,
                      fontWeight: FontWeight.w600),
                ),
                if (isOnline && activity != null)
                  Text(
                    activity!,
                    overflow: TextOverflow.ellipsis,
                    style:
                        const TextStyle(fontSize: 11, color: channelsDefault),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
