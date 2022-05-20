import 'package:fluent_ui/fluent_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/colors.dart';

class ServerListTile extends StatefulWidget {
  const ServerListTile({
    Key? key,
    required this.serverName,
    this.imageUrl,
    this.isAnActionButton = false,
    this.tooltipMessage,
    this.isActive = false,
  }) : super(key: key);

  final String serverName;
  final String? imageUrl;
  final bool isAnActionButton;
  final String? tooltipMessage;
  final bool isActive;

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
          return Opacity(
            opacity: 0.8,
            child: Image.network(
              'https://i.ibb.co/4sg5gnR/Discord-Logo-White.png',
              width: 24,
            ),
          );
        }

        return Text(
          widget.serverName.substring(0, 1),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isHovering ? interactiveActive : textColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        );
      }

      if (widget.serverName == 'Add') {
        return Icon(
          FontAwesomeIcons.plus,
          size: 24,
          color: isHovering ? interactiveActive : textColor,
        );
      }

      if (widget.serverName == 'Explore') {
        return Icon(
          FluentIcons.compass_n_w,
          size: 24,
          color: isHovering ? interactiveActive : textColor,
        );
      }

      return FaIcon(
        FontAwesomeIcons.solidCircleQuestion,
        size: 24,
        color: isHovering ? interactiveActive : textColor,
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
    final BorderRadius borderRadius = isHovering || widget.isActive
        ? hoveredBorderRadius
        : unhoveredBorderRadius;

    final Color backgroundColorType =
        widget.isAnActionButton ? statusOnline : serverLogoHover;
    final Color backgroundColor = widget.imageUrl == null
        ? isHovering || widget.isActive
            ? backgroundColorType
            : backgroundPrimary
        : Colors.transparent;

    return Stack(
      children: [
        // Server logo
        AnimatedContainer(
          key: ValueKey('AnimatedController ${widget.serverName}'),
          width: 48,
          height: 48,
          margin: const EdgeInsets.symmetric(horizontal: 12),
          alignment: Alignment.center,
          clipBehavior: Clip.antiAlias,
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius,
          ),
          child: child,
        ),

        // Active indicator
        if (widget.isActive)
          Positioned(
            top: 3,
            bottom: 3,
            left: -4,
            child: Container(
              width: 8,
              decoration: const BoxDecoration(
                color: interactiveActive,
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(4)),
              ),
            ),
          ),

        // Hover indicator
        if (!widget.isActive)
          Positioned(
            top: 14,
            bottom: 14,
            left: -4,
            child: AnimatedContainer(
              width: isHovering ? 8 : 0,
              duration: const Duration(milliseconds: 200),
              decoration: const BoxDecoration(
                color: interactiveActive,
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(4)),
              ),
            ),
          ),
      ],
    );
  }
}
