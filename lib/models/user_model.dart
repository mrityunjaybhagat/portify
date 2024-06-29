class User {
  //final int id;
  final String id;
  final String username;
  //final String token;
  final String email;
  final String mobile;
  final String profilePicture;

  User({
    required this.id,
    required this.username,
    //required this.token,
    required this.email,
    required this.mobile,
    required this.profilePicture,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      //id: json['id'] as int, // Ensure id is parsed as int
      id: json['id'] as String,
      username: json['username'] as String,
      //token: json['token'] as String,
      email: json['email'] as String,
      mobile: json['mobile'] as String,
      profilePicture: json['profile_picture'] as String,
    );
  }
}
