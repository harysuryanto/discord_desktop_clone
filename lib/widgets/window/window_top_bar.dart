import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:window_manager/window_manager.dart';

import '../../utils/colors.dart';
import 'window_button.dart';

class WindowTopBar extends StatelessWidget {
  const WindowTopBar({
    Key? key,
    required this.appTitle,
  }) : super(key: key);

  final String appTitle;
  final double _windowTitleBarHeight = 22; // Size from Discord

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return const SizedBox();
    }

    return SizedBox(
      height: _windowTitleBarHeight,
      child: Row(
        children: [
          Expanded(
            child: DragToMoveArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    appTitle,
                    style: const TextStyle(
                        color: textMuted,
                        fontSize: 12,
                        fontWeight: FontWeight.w900),
                  ),
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
