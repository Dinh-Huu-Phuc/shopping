import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_textstyles.dart';
import '../model/address.dart';
import '../repositories/address_repository.dart';
import 'address_card.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({super.key});

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  final AddressRepository _repo = AddressRepository();
  late List<Address> _addresses;

  @override
  void initState() {
    super.initState();
    _addresses = _repo.getAddresses();
  }

  Future<void> _onEdit(Address address) async {
    final updated = await _showEditAddressBottomSheet(context, address);
    if (updated is Address) {
      setState(() {
        final i = _addresses.indexWhere((a) => a.id == updated.id);
        if (i != -1) _addresses[i] = updated;
      });
      Get.snackbar(
        'Updated',
        'Cập nhật địa chỉ thành công',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    }
  }

  void _onDelete(Address address) async {
    final ok = await _confirmDeleteAddress(address);
    if (ok != true) return;
    setState(() {
      _addresses.removeWhere((a) => a.id == address.id);
    });
    Get.snackbar(
      'Deleted',
      'Đã xóa địa chỉ ${address.label}',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  Future<bool?> _confirmDeleteAddress(Address address) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Get.bottomSheet<bool>(
      SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.delete_outline,
                size: 32,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 12),
              Text(
                'Xóa địa chỉ?',
                style: AppTextstyles.withColor(
                  AppTextstyles.h3,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Bạn có chắc muốn xóa “${address.label}” không?',
                textAlign: TextAlign.center,
                style: AppTextstyles.withColor(
                  AppTextstyles.bodyLarge,
                  isDark ? Colors.grey[400]! : Colors.grey[700]!,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(result: false),
                      child: const Text('Hủy'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Get.back(result: true),
                      child: const Text('Xóa'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shipping Address',
          style: AppTextstyles.withColor(
            AppTextstyles.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () => _showAddAddressBottomSheet(context),
            icon: Icon(
              Icons.add_circle_outline,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: _addresses.isEmpty
            ? Center(
                child: Text(
                  'Chưa có địa chỉ',
                  style: AppTextstyles.withColor(
                    AppTextstyles.bodyLarge,
                    isDark ? Colors.grey[400]! : Colors.grey[600]!,
                  ),
                ),
              )
            : ListView.separated(
                itemCount: _addresses.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final address = _addresses[index];
                  return AddressCard(
                    address: address,
                    onEdit: () => _onEdit(address),
                    onDelete: () => _onDelete(address),
                  );
                },
              ),
      ),
    );
  }

  void _showAddAddressBottomSheet(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add New Address',
                  style: AppTextstyles.withColor(
                    AppTextstyles.h3,
                    Theme.of(context).textTheme.bodyLarge!.color!,
                  ),
                ),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.close,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            _buildTextField(
              context,
              'Label(e.g, Home, Office)',
              Icons.label_outlined,
            ),
            SizedBox(height: 16),
            _buildTextField(
              context,
              'Full Address',
              Icons.location_on_outlined,
            ),
            SizedBox(height: 16),
            _buildTextField(context, 'City', Icons.location_city_outlined),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    context,
                    'State',
                    Icons.map_outlined,
                  ),
                ),
                SizedBox(width: 16,),
                Expanded(
                  child: _buildTextField(
                    context,
                    'Zip Code',
                    Icons.pin_outlined,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  //handle Save address
                  Get.back();
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDark? Colors.white : Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Save Address',
                  style: AppTextstyles.withColor(
                    AppTextstyles.buttonMedium,
                    isDark? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context, String label, IconData icon) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Theme.of(context).primaryColor),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}

Future<Address?> _showEditAddressBottomSheet(
  BuildContext context,
  Address address,
) {
  final isDark = Theme.of(context).brightness == Brightness.dark;

  final labelCtrl = TextEditingController(text: address.label); // ✅ label
  final fullCtrl = TextEditingController(text: address.fullAddress);
  final cityCtrl = TextEditingController(text: address.city);
  final stateCtrl = TextEditingController(text: address.state);
  final zipCtrl = TextEditingController(text: address.zipCode);

  InputDecoration deco(String label, IconData icon) => InputDecoration(
    labelText: label,
    prefixIcon: Icon(icon, color: Theme.of(context).primaryColor),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Theme.of(context).primaryColor),
    ),
  );

  return Get.bottomSheet<Address?>(
    SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            bottom: MediaQuery.of(context).viewInsets.bottom + 24,
            top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Edit Address',
                    style: AppTextstyles.withColor(
                      AppTextstyles.h3,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Get.back(result: null),
                    icon: Icon(
                      Icons.close_outlined,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: labelCtrl,
                decoration: deco(
                  'Label (e.g. Home, Office)',
                  Icons.label_outline,
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: fullCtrl,
                decoration: deco('Full Address', Icons.location_on_outlined),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: cityCtrl,
                decoration: deco('City', Icons.location_city_outlined),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: stateCtrl,
                      decoration: deco('State', Icons.map_outlined),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: zipCtrl,
                      decoration: deco('Zip Code', Icons.pin_outlined),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final updated = address.copyWith(
                      label: labelCtrl.text, // ✅ label
                      fullAddress: fullCtrl.text,
                      city: cityCtrl.text,
                      state: stateCtrl.text,
                      zipCode: zipCtrl.text,
                    );
                    Get.back(result: updated);
                  },
                  child: const Text('Update Address'),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    isScrollControlled: true,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
  );
}
