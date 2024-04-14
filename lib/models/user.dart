import 'dart:convert';

class User {
    final int id;
    final String name;
    final String? email;
    final dynamic emailVerifiedAt;
    final int roleId;
    final String? token;

    User({
        required this.id,
        required this.name,
        this.email,
        this.emailVerifiedAt,
        required this.roleId,
        this.token,
    });

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        roleId: json["role_id"],
        token: json["token"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "role_id": roleId,
        "token": token,
    };
}
