import 'package:fluent_ui/fluent_ui.dart';

import '../../colors.dart';

class AvatarWithOnlineStatus extends StatelessWidget {
  const AvatarWithOnlineStatus({
    Key? key,
    this.imageUrl,
    required this.username,
    this.isOnline = false,
  }) : super(key: key);

  final String? imageUrl;
  final String username;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: grey4,
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.antiAlias,
          child: imageUrl == null
              ? Center(child: Text(username.substring(0, 1)))
              : Image.network(imageUrl!),
        ),
        if (isOnline)
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
    );
  }
}
