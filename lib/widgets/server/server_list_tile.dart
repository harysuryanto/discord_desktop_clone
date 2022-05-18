import 'package:fluent_ui/fluent_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../colors.dart';

class ServerListTile extends StatefulWidget {
  const ServerListTile({
    Key? key,
    required this.serverName,
    this.imageUrl,
    this.isAnActionButton = false,
    this.tooltipMessage,
  }) : super(key: key);

  final String serverName;
  final String? imageUrl;
  final bool isAnActionButton;
  final String? tooltipMessage;

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
        if (widget.serverName == 'Home') {
          return Image.network(
            'https://i.ibb.co/4sg5gnR/Discord-Logo-White.png',
            width: 24,
          );
        }

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

      if (widget.serverName == 'Add') {
        return Icon(
          FontAwesomeIcons.plus,
          size: 20,
          color: isHovering ? Colors.white : textColor,
        );
      }

      if (widget.serverName == 'Explore') {
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

    return Tooltip(
      key: ValueKey('Tooltip ${widget.serverName}'),
      message: widget.tooltipMessage ?? widget.serverName,
      displayHorizontally: true,
      useMousePosition: false,
      excludeFromSemantics: true,
      style: const TooltipThemeData(
        waitDuration: Duration(milliseconds: 0),
        margin: EdgeInsets.symmetric(horizontal: 14),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          color: backgroundTertiary,
        ),
        textStyle: TextStyle(
          fontSize: 14,
          color: textNormal,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: MouseRegion(
        key: ValueKey('MouseRegion ${widget.serverName}'),
        onHover: (event) => setState(() => isHovering = true),
        onExit: (event) => setState(() => isHovering = false),
        cursor: SystemMouseCursors.click,
        child: _buildRoundedRectangle(
          isHovering: isHovering,
          child:
              widget.imageUrl == null ? text : Image.network(widget.imageUrl!),
        ),
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
        key: ValueKey('AnimatedController ${widget.serverName}'),
        alignment: Alignment.center,
        clipBehavior: Clip.hardEdge,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: isHovering ? backgroundColor : backgroundPrimary,
          borderRadius:
              isHovering ? hoveredBorderRadius : unhoveredBorderRadius,
        ),
        child: child,
      ),
    );
  }
}
