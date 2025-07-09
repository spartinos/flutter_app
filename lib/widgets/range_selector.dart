import 'package:flutter/material.dart';

class RangeSelector extends StatelessWidget {
  final List<String> ranges;
  final String selectedRange;
  final Function(String) onChanged;

  const RangeSelector({
    Key? key,
    required this.ranges,
    required this.selectedRange,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 12,
      runSpacing: 12,
      children: ranges.map((range) {
        final selected = range == selectedRange;
        return GestureDetector(
          onTap: () => onChanged(range),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            decoration: BoxDecoration(
              color: selected
                  ? Theme.of(context).primaryColor
                  : Colors.grey[100],
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: selected ? Colors.transparent : Colors.grey.shade300,
              ),
            ),
            child: Text(
              range,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: selected ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
