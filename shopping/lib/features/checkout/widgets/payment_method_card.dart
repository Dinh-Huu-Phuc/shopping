import 'package:flutter/material.dart';

import '../../../utils/app_textstyles.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.2)
                : Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDark
                      ? Colors.black.withOpacity(0.2)
                      : Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.network(
                  'https://athgroup.vn/upload/blocks/thumb_1920x0/ATH-kh%C3%A1m-ph%C3%A1-b%E1%BB%99-nh%E1%BA%ADn-di%E1%BB%87n-mastercard-4.png',
                  height: 24,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Visa ending in 9701 *** 4242',
                      style: AppTextstyles.withColor(
                        AppTextstyles.bodyLarge,
                        Theme.of(context).textTheme.bodyLarge!.color!,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Expires 12/24',
                      style: AppTextstyles.withColor(
                        AppTextstyles.bodySmall,
                        isDark? Colors.grey[400]!:Colors.grey[600]!,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: (){}, 
                icon: Icon(
                  Icons.edit_outlined,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
