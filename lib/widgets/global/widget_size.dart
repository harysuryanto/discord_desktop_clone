import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

class WidgetSize extends StatefulWidget {
  final Widget child;
  final Function onChange;

  const WidgetSize({
    Key? key,
    required this.onChange,
    required this.child,
  }) : super(key: key);

  @override
  State<WidgetSize> createState() => _WidgetSizeState();
}

class _WidgetSizeState extends State<WidgetSize> {
  GlobalKey widgetKey = GlobalKey();
  Size? oldSize;
  Size? newSize;

  void postFrameCallback(_) {
    BuildContext? context = widgetKey.currentContext;

    if (context == null) return;

    newSize = context.size;

    if (oldSize == newSize) return;

    oldSize = newSize;
    widget.onChange(newSize);
  }

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback(postFrameCallback);
    return Container(
      key: widgetKey,
      child: widget.child,
    );
  }
}
