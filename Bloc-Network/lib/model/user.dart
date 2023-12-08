class User {
  int id;
  String firstname;
  String? email;
  String? phone;

  User({
    required this.id,
    required this.firstname,
    this.email,
    this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstname: json['firstname'],
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
    );
  }
}
