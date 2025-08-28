import '../models/notification_type.dart';

class NotificationRepository{
  List<NotificationItem> getNotifications(){
    return [
      NotificationItem(
        title: 'Order Confirmed', 
        message: 'You order #123456 has been confirmed and is begin processed', 
        time: '2 mimutes ago', 
        type: NotificationType.order,
        isRead: true,
      ),
      NotificationItem(
        title: 'Special Offer!', 
        message: 'Get 20% off on all shose this weekend!', 
        time: '2 hour ago', 
        type: NotificationType.promo,
      ),
      NotificationItem(
        title: 'Out for delivery', 
        message: 'You order #124456 is out for delivery', 
        time: '3 mimutes ago', 
        type: NotificationType.delivery,
        isRead: true,
      ),
      NotificationItem(
        title: 'Payment Successful', 
        message: 'You order #43244 was successful', 
        time: '2 mimutes ago', 
        type: NotificationType.payment,
        isRead: true,
      ),
    ];
    
  }
}