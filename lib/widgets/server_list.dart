import '../colors.dart';
import 'package:fluent_ui/fluent_ui.dart';

class ServerList extends StatelessWidget {
  const ServerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      child: ListView(
        controller: ScrollController(),
        padding: const EdgeInsets.all(12),
        children: const [
          ServerListTile(
              serverName: 'Home',
              imageUrl: 'https://i.ibb.co/4sg5gnR/Discord-Logo-White.png'),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          ServerListTile(serverName: 'Pisang'),
          SizedBox(height: 10),
          ServerListTile(
              serverName: 'RPL-B Squad',
              imageUrl:
                  'https://cdn.discordapp.com/icons/757200769819869226/f3cf101df6b34c91997101438e56c072.webp?size=96'),
        ],
      ),
    );
  }
}

class ServerListTile extends StatefulWidget {
  const ServerListTile({
    Key? key,
    required this.serverName,
    this.imageUrl,
  }) : super(key: key);

  final String serverName;
  final String? imageUrl;

  @override
  State<ServerListTile> createState() => _ServerListTileState();
}

class _ServerListTileState extends State<ServerListTile> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) => setState(() => isHovering = true),
      onExit: (event) => setState(() => isHovering = false),
      cursor: SystemMouseCursors.click,
      child: _buildRoundedRectangle(
        isHovering: isHovering,
        child: widget.imageUrl == null
            ? Text(widget.serverName.substring(0, 1))
            : Image.network(widget.imageUrl!),
      ),
    );
  }

  Widget _buildRoundedRectangle({
    required bool isHovering,
    required Widget child,
  }) {
    final BorderRadius unhoveredBorderRadius = BorderRadius.circular(50);
    final BorderRadius hoveredBorderRadius = BorderRadius.circular(15);

    return AspectRatio(
      aspectRatio: 1,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isHovering ? blueAccent : grey4,
          borderRadius:
              isHovering ? hoveredBorderRadius : unhoveredBorderRadius,
        ),
        alignment: Alignment.center,
        clipBehavior: Clip.hardEdge,
        child: child,
      ),
    );
  }
}
