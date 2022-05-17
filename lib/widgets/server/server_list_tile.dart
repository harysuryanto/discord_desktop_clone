import 'package:fluent_ui/fluent_ui.dart';

import '../../colors.dart';

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
            ? Text(
                widget.serverName.substring(0, 1),
                style: const TextStyle(color: textNormal),
              )
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
          color: isHovering ? serverLogoHover : backgroundPrimary,
          borderRadius:
              isHovering ? hoveredBorderRadius : unhoveredBorderRadius,
        ),
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        child: child,
      ),
    );
  }
}
