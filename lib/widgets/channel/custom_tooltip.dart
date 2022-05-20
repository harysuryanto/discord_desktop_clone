import 'package:discord_desktop_clone/utils/colors.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';

class ClickToCopy extends StatefulWidget {
  const ClickToCopy({
    Key? key,
    required this.child,
    this.textToCopy,
    this.description,
  }) : super(key: key);

  final Widget child;
  final String? textToCopy;
  final String? description;

  @override
  State<ClickToCopy> createState() => _ClickToCopy();
}

class _ClickToCopy extends State<ClickToCopy> {
  bool isTooltipClicked = false;
  bool isTooltipHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => isTooltipHovered = true),
      onExit: (event) {
        if (!isTooltipClicked) {
          setState(() => isTooltipHovered = false);
        }
      },
      child: GestureDetector(
        child: Container(
          color: Colors.transparent,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              if (isTooltipHovered || isTooltipClicked)
                Positioned(
                  top: -45,
                  left: -60,
                  right: -60,
                  child: _buildTooltip(),
                ),
              Positioned(child: widget.child),
            ],
          ),
        ),
        onTap: () {
          Clipboard.setData(ClipboardData(text: widget.textToCopy));

          setState(() => isTooltipClicked = true);
          Future.delayed(const Duration(seconds: 1)).then((_) {
            setState(() {
              isTooltipClicked = false;
              isTooltipHovered = false;
            });
          });
        },
      ),
    );
  }

  Widget _buildTooltip() {
    const TextStyle textStyle = TextStyle(fontSize: 14, color: textNormal);

    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          color: isTooltipClicked ? statusOnline : backgroundTertiary,
        ),
        child: isTooltipClicked
            ? const Text('Copied!', style: textStyle)
            : Text(
                widget.description ?? 'Click to copy',
                style: textStyle,
              ),
      ),
    );
  }
}
