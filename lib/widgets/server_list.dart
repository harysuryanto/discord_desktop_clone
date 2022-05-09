import 'package:discord_desktop_clone/colors.dart';
import 'package:fluent_ui/fluent_ui.dart';

class ServerList extends StatelessWidget {
  const ServerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      child: ListView(
        padding: const EdgeInsets.all(12),
        children: const [
          CircleAvatar(
            backgroundColor: grey2,
            child: FlutterLogo(),
          ),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          CircleAvatar(
            backgroundColor: grey2,
            child: Text('P'),
          ),
        ],
      ),
    );
  }
}
