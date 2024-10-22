class user {
  final String email;
  final String gender;
  final String phone;
  final String cell;
  final UserName name;

  user({
    required this.email,
    required this.gender,
    required this.phone,
    required this.cell,
    required this.name,
  });

  // Convert user object to JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'gender': gender,
      'phone': phone,
      'cell': cell,
      'name': name.toJson(),
    };
  }

  // Create a user object from JSON
  factory user.fromJson(Map<String, dynamic> json) {
    return user(
      email: json['email'],
      gender: json['gender'],
      phone: json['phone'],
      cell: json['cell'],
      name: UserName.fromJson(json['name']),
    );
  }
}

class UserName {
  final String title;
  final String first;
  final String last;

  UserName({
    required this.title,
    required this.first,
    required this.last,
  });

  // Convert UserName to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'first': first,
      'last': last,
    };
  }

  // Create a UserName from JSON
  factory UserName.fromJson(Map<String, dynamic> json) {
    return UserName(
      title: json['title'],
      first: json['first'],
      last: json['last'],
    );
  }
}

// Example usage in your getUserFromDb method:

