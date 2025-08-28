import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/features/notifications/models/notification_type.dart';
import 'package:shopping/features/notifications/utils/notification_utils.dart';
import 'package:shopping/utils/app_textstyles.dart';
import '../repositories/notification_repository.dart';
class NotificationsScreen extends StatefulWidget {
  final NotificationRepository _repository = NotificationRepository();
   NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final notifications = widget._repository.getNotifications();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(), 
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          'notifications',
          style: AppTextstyles.withColor(
            AppTextstyles.h3,
            isDark? Colors.white : Colors.black,
          ),
        ),
        actions: [
          TextButton(
            onPressed: (){},
            child: Text(
              'Mark all as real',
              style: AppTextstyles.withColor(
                AppTextstyles.bodyMedium,
                isDark? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) => _buildNotificationCard(
          context,
          notifications[index],
        ),
      ),
    );
  }

  Widget _buildNotificationCard(BuildContext context, NotificationItem notification){
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: EdgeInsets.only(
        bottom: 16,
      ),
      decoration: BoxDecoration(
        color: notification.isRead?
        Theme.of(context).cardColor
        : Theme.of(context).colorScheme.secondary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDark
            ?Colors.black.withOpacity(0.2)
            :Colors.grey.withOpacity(0.1),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: NotificationUtils.getIconBackgroundColor(
              context, 
              notification.type
            ),
            shape: BoxShape.circle,
          ),
          child: Icon(
            NotificationUtils.getNotificatIcon(
              notification.type
            ),
            color: NotificationUtils.getIconColor(
              context, 
              notification.type
            ),
          ),
        ),
        title: Text(
          notification.title,
          style: AppTextstyles.withColor(
            AppTextstyles.bodyLarge,
            Theme.of(context).textTheme.bodyLarge!.color!,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4,),
            Text(
              notification.message,
              style: AppTextstyles.withColor(
            AppTextstyles.bodySmall,
            isDark ? Colors.grey[400]! : Colors.grey[600]!,
          ),
            ),
          ],
        ),
      ),
    );
  }
}