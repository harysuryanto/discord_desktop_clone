import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';

import '../../utils/colors.dart';
import 'widget_size.dart';

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
  Size? childSize;

  @override
  Widget build(BuildContext context) {
    return WidgetSize(
      onChange: (Size size) => setState(() => childSize = size),
      child: MouseRegion(
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
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Positioned(child: widget.child),
                if (isTooltipHovered || isTooltipClicked)
                  Positioned(
                    bottom: childSize!.height,
                    child: _buildTooltip(),
                  ),
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
      ),
    );
  }

  Widget _buildTooltip() {
    const TextStyle textStyle = TextStyle(fontSize: 14, color: textNormal);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            color: isTooltipClicked ? statusOnline : backgroundTertiary,
          ),
          child: isTooltipClicked
              ? const Text('Copied!', style: textStyle)
              : Text(widget.description ?? 'Click to copy', style: textStyle),
        ),
        _buildInvertedTriangle(),
      ],
    );
  }

  Widget _buildInvertedTriangle({double? size = 12}) {
    final Size paintSize =
        size != null ? Size(size, size / 2) : const Size(120, 60);
    return CustomPaint(
      size: paintSize,
      painter: _InvertedTriangle(
          color: isTooltipClicked ? statusOnline : backgroundTertiary),
    );
  }
}

class _InvertedTriangle extends CustomPainter {
  _InvertedTriangle({
    required this.color,
  }) {
    painter = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
  }

  final Color color;
  late final Paint painter;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(0, 0);
    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
