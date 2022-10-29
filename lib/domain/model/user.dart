class User {
  final String? name;
  final String? username;
  final String? image;
  User({
    required this.name,
    required this.username,
    this.image,
  });

  factory User.empty() => User(name: null, username: null, image: null);
}
