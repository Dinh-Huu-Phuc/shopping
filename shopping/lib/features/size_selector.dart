import 'package:flutter/material.dart';

import '../utils/app_themes.dart';

class SizeSelector extends StatefulWidget {
  const SizeSelector({super.key});

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  int selectedSize = 0;
  final sizes = ['S', 'M', 'L', 'XL'];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: List.generate(
        sizes.length,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 8),
          child: ChoiceChip(
            label: Text(
              sizes[index],
              style: TextStyle(
                color: selectedSize == index
                    ? (isDark
                          ? Colors.black
                          : Colors
                                .white) // Chữ đen ở dark mode (khi selected), trắng ở light mode
                    : (isDark
                          ? Colors.white
                          : Colors
                                .black), // Chữ trắng ở dark mode (khi không selected), đen ở light mode
              ),
            ),
            selected: selectedSize == index,
            onSelected: (bool selected) {
              setState(() {
                selectedSize = selected ? index : selectedSize;
              });
            },
            selectedColor: AppThemes.brown,
            labelStyle: TextStyle (
              color: selectedSize == index ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
