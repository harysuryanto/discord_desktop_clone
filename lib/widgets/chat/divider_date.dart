import 'package:fluent_ui/fluent_ui.dart';

import '../../colors.dart';

class DividerDate extends StatelessWidget {
  const DividerDate({
    Key? key,
    required this.date,
  }) : super(key: key);

  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: bodyModifierAccent,
              height: 1,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            date,
            style: const TextStyle(
              fontSize: 11,
              color: textMuted,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Container(
              color: bodyModifierAccent,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
