import 'package:fluent_ui/fluent_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../colors.dart';
import 'divider_date.dart';
import 'message_block.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Scroll to bottom to show the latest message
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      int messageBlockHeight = 52;
      double scrollDestination =
          _scrollController.positions.single.maxScrollExtent +
              messageBlockHeight;

      _scrollController.jumpTo(scrollDestination);
    });
  }

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
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(vertical: 10),
                children: const [
                  DividerDate(date: '05/13/2022'),
                  MessageBlock(
                      imageUrl:
                          'https://cdn.discordapp.com/avatars/653186965474377737/de05515d03b7202a568d0281460c0b41.webp?size=80',
                      username: 'Dicka',
                      date: '05/13/2022',
                      message: 'hi guys'),
                  MessageBlock(
                      imageUrl:
                          'https://cdn.discordapp.com/avatars/261757574540427264/a2ea26914414bf8cae191a4eb6d96313.webp?size=80',
                      username: 'Andi',
                      date: '05/13/2022',
                      message: 'Dickaaaaa'),
                  MessageBlock(
                      imageUrl:
                          'https://cdn.discordapp.com/avatars/653186965474377737/de05515d03b7202a568d0281460c0b41.webp?size=80',
                      username: 'Dicka',
                      date: '05/13/2022',
                      message: 'euy'),
                  MessageBlock(
                      imageUrl:
                          'https://cdn.discordapp.com/avatars/449940864576258049/28cf51b9af6e5a38c187ee13b8019b7d.webp?size=80',
                      username: 'Ganteng9',
                      date: '05/13/2022',
                      message: 'Oke',
                      isAdmin: true),
                  MessageBlock(
                      imageUrl:
                          'https://cdn.discordapp.com/avatars/261757574540427264/a2ea26914414bf8cae191a4eb6d96313.webp?size=80',
                      username: 'Andi',
                      date: '05/13/2022',
                      message: 'Valo Dick'),
                  MessageBlock(
                      imageUrl:
                          'https://cdn.discordapp.com/avatars/653186965474377737/de05515d03b7202a568d0281460c0b41.webp?size=80',
                      username: 'Dicka',
                      date: '05/13/2022',
                      message: 'hayu andi'),
                  MessageBlock(
                      imageUrl:
                          'https://cdn.discordapp.com/avatars/449940864576258049/28cf51b9af6e5a38c187ee13b8019b7d.webp?size=80',
                      username: 'Ganteng9',
                      date: '05/13/2022',
                      message:
                          'Urang hayang miluan tapi teu bisa maen di MacBook 🍎',
                      isAdmin: true),
                  MessageBlock(
                    imageUrl:
                        'https://cdn.discordapp.com/avatars/653186965474377737/de05515d03b7202a568d0281460c0b41.webp?size=80',
                    username: 'Dicka',
                    date: '05/13/2022',
                    message: 'hayu @King Jom-Uy',
                    isMentionedMe: true,
                  ),
                  MessageBlock(
                    imageUrl:
                        'https://cdn.discordapp.com/avatars/871388221836251166/04fa62bc9241e82f1587328146d448d7.webp?size=32',
                    username: 'King Jom-Uy',
                    date: '05/13/2022',
                    message: 'Skip, lagi nyuci tank',
                    isAdmin: true,
                  ),
                ],
              ),
            ),

            /// Text input
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
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
