import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:system_theme/system_theme.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:window_manager/window_manager.dart';

import 'colors.dart';
import 'screens/server_screen.dart';

const String appTitle = 'Discord';

/// Checks if the current environment is a desktop environment.
bool get isDesktop {
  if (kIsWeb) return false;
  return [
    TargetPlatform.windows,
    TargetPlatform.linux,
    TargetPlatform.macOS,
  ].contains(defaultTargetPlatform);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // if it's on the web, windows or android, load the accent color
  if (kIsWeb ||
      [TargetPlatform.windows, TargetPlatform.android]
          .contains(defaultTargetPlatform)) {
    SystemTheme.accentColor.load();
  }

  setPathUrlStrategy();

  if (isDesktop) {
    await WindowManager.instance.ensureInitialized();

    WindowOptions windowOptions = WindowOptions(
      title: appTitle,
      titleBarStyle: TitleBarStyle.hidden,
      // size: const Size(940, 500),
      minimumSize: const Size(940, 500),
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {});
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: appTitle,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const ServerScreen(),
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.purple,
        visualDensity: VisualDensity.standard,
        iconTheme: const IconThemeData(color: interactiveNormal),
        focusTheme: FocusThemeData(
          glowFactor: is10footScreen() ? 2.0 : 0.0,
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          horizontalMargin: EdgeInsets.zero,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(0, 0),
                blurRadius: 0.4,
                spreadRadius: 0,
              ),
            ],
          ),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return Container(
          color: backgroundTertiary, // Background color
          child: child!,
        );
      },
    );
  }
}
