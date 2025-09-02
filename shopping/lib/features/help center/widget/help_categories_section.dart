import 'package:flutter/material.dart';
import 'package:shopping/utils/app_textstyles.dart';
import 'category_card.dart';

class HelpCategoriesSection extends StatelessWidget {
  const HelpCategoriesSection({super.key});

  static const _categories = <Map<String, Object>>[
    {'icon': Icons.shopping_bag_outlined, 'title': 'Orders'},
    {'icon': Icons.payment_outlined, 'title': 'Payment'},
    {'icon': Icons.local_shipping_outlined, 'title': 'Shipping'},
    {'icon': Icons.assignment_return_outlined, 'title': 'Returns'},
  ];

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Help Categories', style: AppTextstyles.withColor(AppTextstyles.h3, textColor!)),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.5,
            ),
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              // Debug nhanh nếu từng bị state cũ:
              assert(index < _categories.length, 'Index out of range');
              final item = _categories[index];
              return CategoryCard(
                title: item['title'] as String,
                icon: item['icon'] as IconData,
              );
            },
          ),
        ],
      ),
    );
  }
}
