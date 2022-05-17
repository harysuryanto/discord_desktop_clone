import 'package:bitsdojo_window_flutter3/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:window_manager/window_manager.dart';

import 'window_button.dart';

class WindowTopBar extends StatelessWidget {
  const WindowTopBar({
    Key? key,
    required this.appTitle,
  }) : super(key: key);

  final String appTitle;

  @override
  Widget build(BuildContext context) {
    return WindowTitleBarBox(
      child: Row(
        children: [
          Expanded(
            child: DragToMoveArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
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
    );
  }
}
