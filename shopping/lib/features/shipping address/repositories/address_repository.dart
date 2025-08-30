import '../model/address.dart';

class AddressRepository {
  List<Address> getAddresses() {
    return [
      Address(
        id: '1',
        label: 'Home',
        fullAddress: '123 JQK',
        city: 'DaLat',
        state: 'VN',
        zipCode: '670000',
        isDefault: true,
        type: AddressType.home,
      ),
      Address(
        id: '2',
        label: 'TDSV',
        fullAddress: '324 Business Ave',
        city: 'DaLat',
        state: 'VN',
        zipCode: '670000',
        type: AddressType.TDSV,
      ),
    ];
  }

  // (tuỳ chọn) ví dụ delete theo id
  void deleteById(String id) {
    // nếu bạn đang lưu local state ở controller thì bỏ repo delete.
  }
}
