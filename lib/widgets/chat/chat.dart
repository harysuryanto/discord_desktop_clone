import 'package:fluent_ui/fluent_ui.dart';
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
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: const BoxDecoration(
                color: channeltextareaBackground,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Row(
                children: [
                  IconButton(
                      icon: const Icon(FluentIcons.circle_addition_solid),
                      onPressed: () {}),
                  const Expanded(
                    child: TextBox(
                      placeholder: 'Message #ngobrol-santai',
                      placeholderStyle: TextStyle(color: textMuted),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                  ),
                  IconButton(
                      icon: const FaIcon(FontAwesomeIcons.gift),
                      onPressed: () {}),
                  IconButton(
                      icon: const Icon(FluentIcons.gif), onPressed: () {}),
                  IconButton(
                      icon: const Icon(FluentIcons.sticky_notes_solid_app_icon),
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
