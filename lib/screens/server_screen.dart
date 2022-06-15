import 'package:fluent_ui/fluent_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:window_manager/window_manager.dart';

import '../utils/colors.dart';
import '../widgets/channel/channel.dart';
import '../widgets/chat/chat.dart';
import '../widgets/online/online.dart';
import '../widgets/server/server.dart';
import '../widgets/window/window_wrapper.dart';

class ServerScreen extends StatefulWidget {
  const ServerScreen({Key? key}) : super(key: key);

  @override
  State<ServerScreen> createState() => _ServerScreenState();
}

class _ServerScreenState extends State<ServerScreen> with WindowListener {
  bool isMemberListHidden = false;

  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isScreenWidthLessThan750 = screenWidth < 750;

    return WindowWrapper(
      content: isScreenWidthLessThan750
          ? const Center(
              child: SelectableText(
                  'This app is not optimized for small screen. Please use a computer or laptop for the best experience. Device with screen wider than 750 pixel is mandatory.'),
            )
          : Row(
              children: [
                const Server(),
                const Channel(),
                Expanded(
                  child: Column(
                    children: [
                      _buildTopBar(),
                      const Divider(),
                      Expanded(
                        child: Row(
                          children: [
                            const Chat(key: ValueKey('Chat')),
                            Visibility(
                              visible: !isMemberListHidden,
                              child: const Online(key: ValueKey('Online')),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      color: backgroundPrimary,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          const FaIcon(FontAwesomeIcons.hashtag, size: 18),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              'ngobrol-santai',
              softWrap: false,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.fade,
                  color: interactiveActive),
            ),
          ),
          IconButton(
              icon: const Icon(FontAwesomeIcons.hashtag), onPressed: () {}),
          IconButton(
              icon: const Icon(FontAwesomeIcons.solidBell), onPressed: () {}),
          IconButton(
              icon: const Icon(FontAwesomeIcons.mapPin), onPressed: () {}),
          IconButton(
              icon: FaIcon(
                FontAwesomeIcons.userGroup,
                color: isMemberListHidden ? null : interactiveActive,
              ),
              onPressed: () {
                setState(() => isMemberListHidden = !isMemberListHidden);
              }),
          const SizedBox(width: 10),
          SizedBox(
            width: 220,
            child: Row(
              children: [
                const Expanded(
                  child: TextBox(
                    suffix: Icon(FluentIcons.search),
                    placeholder: 'Search',
                    decoration: BoxDecoration(color: backgroundTertiary),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                    icon: const FaIcon(FontAwesomeIcons.inbox),
                    onPressed: () {}),
                const SizedBox(width: 10),
                IconButton(
                    icon: const FaIcon(FontAwesomeIcons.solidCircleQuestion),
                    onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
