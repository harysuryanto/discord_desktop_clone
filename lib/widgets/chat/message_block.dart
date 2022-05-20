import 'package:fluent_ui/fluent_ui.dart';

import '../../utils/colors.dart';
import '../global/avatar_with_online_status.dart';

class MessageBlock extends StatelessWidget {
  const MessageBlock({
    Key? key,
    this.imageUrl,
    required this.username,
    required this.message,
    required this.date,
    this.isAdmin = false,
    this.isMentionedMe = false,
  }) : super(key: key);

  final String? imageUrl;
  final String username;
  final String date;
  final String message;
  final bool isAdmin;
  final bool isMentionedMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        children: [
          if (isMentionedMe) _buildMentionIndicator(),
          Positioned(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Row(
                children: [
                  AvatarWithOnlineStatus(
                    username: username,
                    width: 40,
                    height: 40,
                    imageUrl: imageUrl,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              username,
                              style: TextStyle(
                                fontSize: 14,
                                color: isAdmin ? adminName : interactiveActive,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              date,
                              style: const TextStyle(
                                color: interactiveNormal,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 0),
                        Text(
                          message,
                          style: const TextStyle(color: interactiveNormal),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMentionIndicator() {
    return Positioned.fill(
      child: Row(
        children: [
          Container(
            width: 2,
            color: infoWarningForeground, // TODO: ambil warna
          ),
          Expanded(
            child: Opacity(
              opacity: 0.15,
              child: Container(
                width: 2,
                color: infoWarningForeground, // TODO: ambil warna
              ),
            ),
          ),
        ],
      ),
    );
  }
}
