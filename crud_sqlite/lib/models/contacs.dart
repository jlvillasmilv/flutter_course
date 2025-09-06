class Contact {
  final int id;
  final String name;
  final String phone;
  final String email;

  //id is not required because it is autoincrement
  const Contact({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {'name': name, 'phone': phone, 'email': email};
  }
}
