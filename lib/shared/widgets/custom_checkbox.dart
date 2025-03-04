import 'package:dribble_design/core/utils/color_const.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final bool initialSelected;
  final ValueChanged<bool> onChanged;

  const CustomCheckbox({
    super.key,
    this.initialSelected = false,
    required this.onChanged,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool selected;

  @override
  void initState() {
    super.initState();
    selected = widget.initialSelected;
  }

  void _toggleCheckbox() {
    setState(() {
      selected = !selected;
    });

    widget.onChanged(selected);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCheckbox,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected ? ColorConst.primary : const Color(0xFF0B0B12),
        ),
        child: selected
            ? const Icon(Icons.check, size: 16, color: Colors.white)
            : null,
      ),
    );
  }
}
