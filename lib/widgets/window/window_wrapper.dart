import 'package:fluent_ui/fluent_ui.dart';

import '../../main.dart';
import 'window_top_bar.dart';

class WindowWrapper extends StatelessWidget {
  const WindowWrapper({Key? key, required this.content}) : super(key: key);

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WindowTopBar(appTitle: appTitle),
        Expanded(child: content),
      ],
    );
  }
}
