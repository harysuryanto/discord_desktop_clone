import 'package:discord_desktop_clone/colors.dart';
import 'package:fluent_ui/fluent_ui.dart';

class Online extends StatelessWidget {
  const Online({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      color: grey3,
      child: ListView(
        children: const [
          Text('online'),
        ],
      ),
    );
  }
}
