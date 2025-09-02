import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/utils/app_textstyles.dart';

class QuestionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  const QuestionCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black.withOpacity(0.2) : Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.secondary),
        title: Text(
          title,
          style: AppTextstyles.withColor(
            AppTextstyles.bodyMedium,
            isDark ? Colors.white : Colors.black,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: isDark ? Colors.grey[400]! : Colors.grey[600]!,
          size: 16,
        ),
        onTap: () => _showAnswerBottomSheet(context, title, isDark),
      ),
    );
  }

  void _showAnswerBottomSheet(BuildContext context, String question, bool isDark) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    question,
                    style: AppTextstyles.withColor(
                      AppTextstyles.h3,
                      isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.close_outlined, color: isDark ? Colors.white : Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              _getAnswer(question),
              style: AppTextstyles.withColor(
                AppTextstyles.bodyMedium,
                isDark ? Colors.grey[400]! : Colors.grey[600]!,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(
                  'Got It',
                  style: AppTextstyles.withColor(AppTextstyles.h3, isDark ? Colors.black : Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }

  String _getAnswer(String question) {
    const answers = {
      'How to track my order?':
          'To track your order:\n\n'
          '1. Go to "My Orders" in your account\n'
          '2. Select the order you want to track\n'
          '3. Tap "Track Order"\n'
          '4. You\'ll see real-time updates about the package location.\n\n'
          'You can also click the tracking number in your confirmation email.',
      'How to return an item?':
          'To return an item:\n\n'
          '1. Go to "My Orders"\n'
          '2. Select the order with the item you want to return\n'
          '3. Tap "Return Item"\n'
          '4. Select a reason for return\n'
          '5. Print the return label\n'
          '6. Pack the item securely\n'
          '7. Drop off at the nearest shipping location.\n\n'
          'Returns must be initiated within 30 days. Refunds process in 5–7 business days after we receive the item.',
    };
    return answers[question] ?? 'Information not available. Please contact support.';
  }
}
