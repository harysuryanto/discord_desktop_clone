import 'package:fluent_ui/fluent_ui.dart';

import '../../colors.dart';

class AvatarWithOnlineStatus extends StatelessWidget {
  const AvatarWithOnlineStatus({
    Key? key,
    this.imageUrl,
    required this.username,
    this.isOnline = false,
    this.width = 32,
    this.height = 32,
    this.backgroundColor = backgroundPrimary,
  }) : super(key: key);

  final String? imageUrl;
  final String username;
  final bool isOnline;
  final double? width;
  final double? height;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(width! / 2),
          ),
          clipBehavior: Clip.antiAlias,
          child: imageUrl == null
              ? Center(child: Text(username.substring(0, 1)))
              : Image.network(imageUrl!, fit: BoxFit.cover),
        ),
        if (isOnline)
          const Positioned(
            bottom: -3,
            right: -3,
            child: CircleAvatar(
              radius: 7,
              backgroundColor: backgroundSecondaryAlt,
              child: CircleAvatar(
                radius: 4,
                backgroundColor: statusOnline,
              ),
            ),
          ),
      ],
    );
  }
}
