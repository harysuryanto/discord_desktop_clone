import '../widgets/channel/channel.dart';
import '../widgets/chat/chat.dart';
import '../widgets/online/online.dart';
import '../widgets/server/server.dart';
import '../widgets/window/window_wrapper.dart';
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
    return WindowWrapper(
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Server(),
          Channel(),
          Chat(),
          Online(),
        ],
      ),
    );
  }
}
