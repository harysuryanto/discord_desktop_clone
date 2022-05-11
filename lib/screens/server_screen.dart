import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:discord_desktop_clone/main.dart';
import 'package:discord_desktop_clone/widgets/channel_list.dart';
import 'package:discord_desktop_clone/widgets/chat.dart';
import 'package:discord_desktop_clone/widgets/online.dart';
import 'package:discord_desktop_clone/widgets/server_list.dart';
import 'package:discord_desktop_clone/widgets/window_button.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:window_manager/window_manager.dart';

class ServerScreen extends StatefulWidget {
  const ServerScreen({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ServerScreen> with WindowListener {
  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 22,
          child: WindowTitleBarBox(
            child: Row(
              children: const [
                Expanded(
                  child: DragToMoveArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: Text(
                        appTitle,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ),
                WindowButtons(),
              ],
            ),
          ),
        ),
        const Body(),
      ],
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          ServerList(),
          ChannelList(),
          Chat(),
          Online(),
        ],
      ),
    );
  }
}
