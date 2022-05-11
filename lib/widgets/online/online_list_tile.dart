import '../global/avatar_with_online_status.dart';
import 'package:fluent_ui/fluent_ui.dart';

class OnlineListTile extends StatelessWidget {
  const OnlineListTile({
    Key? key,
    this.imageUrl,
    required this.username,
    this.activity,
    this.isOnline = true,
  }) : super(key: key);

  final String? imageUrl;
  final String username;
  final String? activity;
  final bool isOnline;

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(username),
              if (isOnline && activity != null)
                Text(activity!, style: const TextStyle(fontSize: 11)),
            ],
          )
        ],
      ),
    );
  }
}
