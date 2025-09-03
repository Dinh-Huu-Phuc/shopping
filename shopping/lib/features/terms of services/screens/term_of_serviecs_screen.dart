import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/features/privacy%20policy/widgets/info_section.dart';
import 'package:shopping/utils/app_textstyles.dart';

class TermOfServiecsScreen extends StatelessWidget {
  const TermOfServiecsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(), 
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: isDark? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          'Terms Of Service',
          style: AppTextstyles.withColor(
            AppTextstyles.h3,
            isDark? Colors.white : Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(screenSize.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoSection(
                title: 'Welcome To Fastion Store', 
                content: 'By accessing and using this application, you accept agree to bound by the terms and provision of this agreement.',

              ),
              InfoSection(
                title: 'Account Registration', 
                content: 'By accessing and using this application, you accept agree to bound by the terms and provision of this agreement.',
                
              ),
              InfoSection(
                title: 'User responsbilities', 
                content: 'By accessing and using this application, you accept agree to bound by the terms and provision of this agreement.',
                
              ),
              InfoSection(
                title: 'Privacy Policy', 
                content: 'By accessing and using this application, you accept agree to bound by the terms and provision of this agreement.',
                
              ),
              InfoSection(
                title: 'Intellectual Property', 
                content: 'By accessing and using this application, you accept agree to bound by the terms and provision of this agreement.',
                
              ),
              InfoSection(
                title: 'Suk Mah Dick', 
                content: 'By accessing and using this application, you accept agree to bound by the terms and provision of this agreement.',
              ),
              SizedBox(height: 24,),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Bản cập nhật tháng 9 năm 2025',
                  style: AppTextstyles.withColor(
                    AppTextstyles.bodySmall,
                    isDark ? Colors.grey[400]! : Colors.grey[600]!,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}