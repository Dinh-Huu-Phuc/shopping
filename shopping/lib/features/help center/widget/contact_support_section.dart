import 'package:flutter/material.dart';
import 'package:shopping/utils/app_textstyles.dart';

class ContactSupportSection extends StatelessWidget {
  const ContactSupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(24),
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark? Colors.white : Colors.black,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(
            Icons.headset_mic_outlined,
            color: isDark? Colors.black : Colors.white,
            size: 48,
          ),
          SizedBox(height: 16,),
          Text(
            'Still need help?',
            style: AppTextstyles.withColor(
              AppTextstyles.h3,
              isDark?  Colors.black : Colors.white,
            ),
          ),
          SizedBox(height: 8,),
          Text(
            'Contact our support team',
            style: AppTextstyles.withColor(
              AppTextstyles.bodyMedium,
              isDark?  Colors.black : Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8,),
          ElevatedButton(
            onPressed: (){}, 
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              padding: EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Contact Support',
              style: AppTextstyles.withColor(
              AppTextstyles.buttonMedium,
              isDark?  Colors.white : Colors.black,
            ),
            ),
          ),
        ],
      ),
    );
  }
}