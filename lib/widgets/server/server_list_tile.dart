import 'package:fluent_ui/fluent_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../colors.dart';

class ServerListTile extends StatefulWidget {
  const ServerListTile({
    Key? key,
    required this.serverName,
    this.imageUrl,
    this.isAnActionButton = false,
  }) : super(key: key);

  final String serverName;
  final String? imageUrl;
  final bool isAnActionButton;

  @override
  State<ServerListTile> createState() => _ServerListTileState();
}

class _ServerListTileState extends State<ServerListTile> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    final Color textColor = widget.isAnActionButton ? statusOnline : textNormal;
    final Widget text = Builder(builder: ((context) {
      if (!widget.isAnActionButton) {
        return Text(
          widget.serverName.substring(0, 1),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isHovering ? Colors.white : textColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        );
      }

      if (widget.serverName == 'add') {
        return Icon(
          FontAwesomeIcons.plus,
          size: 20,
          color: isHovering ? Colors.white : textColor,
        );
      }

      if (widget.serverName == 'explore') {
        return Icon(
          FluentIcons.compass_n_w,
          size: 20,
          color: isHovering ? Colors.white : textColor,
        );
      }

      return FaIcon(
        FontAwesomeIcons.solidCircleQuestion,
        size: 20,
        color: isHovering ? Colors.white : textColor,
      );
    }));

    return MouseRegion(
      onHover: (event) => setState(() => isHovering = true),
      onExit: (event) => setState(() => isHovering = false),
      cursor: SystemMouseCursors.click,
      child: _buildRoundedRectangle(
        isHovering: isHovering,
        child: widget.imageUrl == null ? text : Image.network(widget.imageUrl!),
      ),
    );
  }

  Widget _buildRoundedRectangle({
    required bool isHovering,
    required Widget child,
  }) {
    final BorderRadius unhoveredBorderRadius = BorderRadius.circular(50);
    final BorderRadius hoveredBorderRadius = BorderRadius.circular(15);
    final Color backgroundColor =
        widget.isAnActionButton ? statusOnline : serverLogoHover;

    return AspectRatio(
      aspectRatio: 1,
      child: AnimatedContainer(
        child: child,
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: isHovering ? backgroundColor : backgroundPrimary,
          borderRadius:
              isHovering ? hoveredBorderRadius : unhoveredBorderRadius,
        ),
      ),
    );
  }
}
