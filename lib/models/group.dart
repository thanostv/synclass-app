import 'dart:convert';

class Group {
    final int id;
    final String name;
    final DateTime initialDate;
    final DateTime finalDate;
    final int alumnsAmount;
    final String magicNumber;
    final int teacherId;
    final int? attended;
    final List<Alumn> alumns;
    final List<Day> days;

    Group({
        required this.id,
        required this.name,
        required this.initialDate,
        required this.finalDate,
        required this.alumnsAmount,
        required this.magicNumber,
        required this.teacherId,
        this.attended,
        required this.alumns,
        required this.days,
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
        attended: json["attended"],
        alumns: List<Alumn>.from(json["alumns"].map((x) => Alumn.fromMap(x))),
        days: List<Day>.from(json["days"].map((x) => Day.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "initial_date": "${initialDate.year.toString().padLeft(4, '0')}-${initialDate.month.toString().padLeft(2, '0')}-${initialDate.day.toString().padLeft(2, '0')}",
        "final_date": "${finalDate.year.toString().padLeft(4, '0')}-${finalDate.month.toString().padLeft(2, '0')}-${finalDate.day.toString().padLeft(2, '0')}",
        "alumns_amount": alumnsAmount,
        "magic_number": magicNumber,
        "teacher_id": teacherId,
        "attended": attended,
        "alumns": List<dynamic>.from(alumns.map((x) => x.toMap())),
        "days": List<dynamic>.from(days.map((x) => x.toMap())),
    };
}

class Alumn {
    final int id;
    final int userId;
    final String name;

    Alumn({
        required this.id,
        required this.userId,
        required this.name,
    });

    factory Alumn.fromJson(String str) => Alumn.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Alumn.fromMap(Map<String, dynamic> json) => Alumn(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "name": name,
    };
}

class Day {
    final int id;
    final String name;

    Day({
        required this.id,
        required this.name,
    });

    factory Day.fromJson(String str) => Day.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Day.fromMap(Map<String, dynamic> json) => Day(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
    };
}
