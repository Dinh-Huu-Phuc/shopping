import 'package:shopping/features/my%20orders/model/order.dart';

class OrderRepository {
  List<Order> getOrders(){
    return[
      Order(
        OrderNumber: '123423', 
        itemCount: 2, 
        totalAmount: 2938.3, 
        status: OrderStatus.active, 
        imageUrl: 'assets/image/hoodie_classic_gray.jpg', 
        orderDate: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      Order(
        OrderNumber: '322422', 
        itemCount: 1, 
        totalAmount: 423.3, 
        status: OrderStatus.completed, 
        imageUrl: 'assets/image/denim_jacket_white.jpg', 
        orderDate: DateTime.now().subtract(const Duration(hours: 1)),
      ),
      Order(
        OrderNumber: '1423', 
        itemCount: 2, 
        totalAmount: 9999.9, 
        status: OrderStatus.cancelled, 
        imageUrl: 'assets/image/wide_leg_pants_white.jpg', 
        orderDate: DateTime.now().subtract(const Duration(hours: 4)),
      ),
      Order(
        OrderNumber: '2468', 
        itemCount: 5, 
        totalAmount: 992938.3, 
        status: OrderStatus.active, 
        imageUrl: 'assets/image/slim_fit_shirt_white.jpg', 
        orderDate: DateTime.now().subtract(const Duration(hours: 3)),
      ),
    ];
  }

  List<Order> getOrdersByStatus(OrderStatus status){
  
    return getOrders().where((order) => order.status == status).toList();
  }
}