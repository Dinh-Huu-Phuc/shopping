import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shopping/utils/app_textstyles.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(), 
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: isDark? Colors.white : Colors.black,
            ),
          ),
          title: Text(
            'My Orders',
            style: AppTextstyles.withColor(
              AppTextstyles.h3,
              isDark ? Colors.white : Colors.black,
            ),
          ),
          bottom: TabBar(
            labelColor: Theme.of(context).colorScheme.secondary,
            unselectedLabelColor: isDark? Colors.grey[400]! : Colors.grey[600]!,
            indicatorColor: Theme.of(context).colorScheme.secondary,
            tabs: [
              Tab(text: 'Active',),
              Tab(text: 'Completed',),
              Tab(text: 'Cancelled',),
            ],
          ),
        ),
      ),
    );
  }
}
