import 'package:fluent_ui/fluent_ui.dart';

import '../../colors.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: grey4,
        child: ListView(
          controller: ScrollController(),
          children: const [
            Text('chat'),
          ],
        ),
      ),
    );
  }
}
