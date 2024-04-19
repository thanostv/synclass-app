import 'dart:convert';

class Group {
    final int id;
    final String name;
    final DateTime initialDate;
    final DateTime finalDate;
    final int alumnsAmount;
    final String magicNumber;
    final int teacherId;

    Group({
        required this.id,
        required this.name,
        required this.initialDate,
        required this.finalDate,
        required this.alumnsAmount,
        required this.magicNumber,
        required this.teacherId,
    });

    factory Group.fromJson(String str) => Group.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Group.fromMap(Map<String, dynamic> json) => Group(
        id: json["id"],
        name: json["name"],
        initialDate: DateTime.parse(json["initial_date"]),
        finalDate: DateTime.parse(json["final_date"]),
        alumnsAmount: json["alumns_amount"],
        magicNumber: json["magic_number"],
        teacherId: json["teacher_id"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "initial_date": "${initialDate.year.toString().padLeft(4, '0')}-${initialDate.month.toString().padLeft(2, '0')}-${initialDate.day.toString().padLeft(2, '0')}",
        "final_date": "${finalDate.year.toString().padLeft(4, '0')}-${finalDate.month.toString().padLeft(2, '0')}-${finalDate.day.toString().padLeft(2, '0')}",
        "alumns_amount": alumnsAmount,
        "magic_number": magicNumber,
        "teacher_id": teacherId,
    };
}
