import 'package:discord_desktop_clone/colors.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:window_manager/window_manager.dart';

import '../widgets/channel/channel.dart';
import '../widgets/chat/chat.dart';
import '../widgets/online/online.dart';
import '../widgets/server/server.dart';
import '../widgets/window/window_wrapper.dart';

class ServerScreen extends StatefulWidget {
  const ServerScreen({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ServerScreen> with WindowListener {
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
    return WindowWrapper(
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      const Chat(),
                      Online(isMemberListHidden: isMemberListHidden),
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
          const Text(
            'ngobrol-santai',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          IconButton(
              icon: const FaIcon(FontAwesomeIcons.hashtag), onPressed: () {}),
          IconButton(
              icon: const FaIcon(FontAwesomeIcons.solidBell), onPressed: () {}),
          IconButton(
              icon: const Icon(material.Icons.push_pin), onPressed: () {}),
          IconButton(
              icon: const FaIcon(FontAwesomeIcons.userGroup),
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
                    placeholder: 'Search',
                    suffix: Icon(FluentIcons.search),
                    decoration: BoxDecoration(color: backgroundTertiary),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    textAlignVertical: TextAlignVertical.center,
                    foregroundDecoration: BoxDecoration(shape: BoxShape.circle),
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
