import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'window_button.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:window_manager/window_manager.dart';

class WindowTopBar extends StatelessWidget {
  const WindowTopBar({
    Key? key,
    required this.appTitle,
  }) : super(key: key);

  final String appTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 22,
      child: WindowTitleBarBox(
        child: Row(
          children: [
            Expanded(
              child: DragToMoveArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Text(
                    appTitle,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ),
            const WindowButtons(),
          ],
        ),
      ),
    );
  }
}
