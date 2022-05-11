import 'package:discord_desktop_clone/main.dart';
import 'package:discord_desktop_clone/widgets/window_top_bar.dart';
import 'package:fluent_ui/fluent_ui.dart';

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
