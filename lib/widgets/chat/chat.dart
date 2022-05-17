import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../colors.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: backgroundPrimary,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            /// Top bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  const Text('#'),
                  const SizedBox(width: 10),
                  const Text(
                    'ngobrol-santai',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  IconButton(
                      icon: const FaIcon(FontAwesomeIcons.hashtag),
                      onPressed: () {}),
                  IconButton(
                      icon: const FaIcon(FontAwesomeIcons.solidBell),
                      onPressed: () {}),
                  IconButton(
                      icon: const Icon(material.Icons.push_pin),
                      onPressed: () {}),
                  IconButton(
                      icon: const FaIcon(FontAwesomeIcons.userGroup),
                      onPressed: () {}),
                ],
              ),
            ),

            const Divider(),

            /// Chat list
            Expanded(
              child: ListView(
                controller: ScrollController(),
                padding: const EdgeInsets.all(16),
                children: const [
                  Text('chat'),
                ],
              ),
            ),

            /// Text input
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: channeltextareaBackground,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Row(
                children: [
                  IconButton(
                      icon: const FaIcon(FontAwesomeIcons.solidCircle),
                      onPressed: () {}),
                  const Expanded(
                    child: TextBox(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.zero,
                        // border: BoxBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                      icon: const FaIcon(FontAwesomeIcons.gift),
                      onPressed: () {}),
                  IconButton(
                      icon: const FaIcon(FontAwesomeIcons.textHeight),
                      onPressed: () {}),
                  IconButton(
                      icon: const FaIcon(FontAwesomeIcons.stickerMule),
                      onPressed: () {}),
                  IconButton(
                      icon: const FaIcon(FontAwesomeIcons.solidFaceLaugh),
                      onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
