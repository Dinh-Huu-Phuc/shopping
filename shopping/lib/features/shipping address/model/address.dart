enum AddressType { home, office, other, TDSV }

class Address {
  final String id;
  final String label;        // ✅ sửa 'lable' -> 'label'
  final String fullAddress;
  final String city;
  final String state;
  final String zipCode;
  final bool isDefault;
  final AddressType type;

  const Address({
    required this.id,
    required this.label,
    required this.fullAddress,
    required this.city,
    required this.state,
    required this.zipCode,
    this.isDefault = false,
    this.type = AddressType.home,
  });

  Address copyWith({
    String? id,
    String? label,
    String? fullAddress,
    String? city,
    String? state,
    String? zipCode,
    bool? isDefault,
    AddressType? type,
  }) {
    return Address(
      id: id ?? this.id,
      label: label ?? this.label,
      fullAddress: fullAddress ?? this.fullAddress,
      city: city ?? this.city,
      state: state ?? this.state,
      zipCode: zipCode ?? this.zipCode,
      isDefault: isDefault ?? this.isDefault,
      type: type ?? this.type,
    );
  }

  String get typeString => type.name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Address && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
