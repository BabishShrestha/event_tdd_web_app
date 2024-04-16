class EventModel {
  final int? id;
  final String? name;
  final String? description;
  final String? startTime;
  final String? endTime;
  final User? user;

  EventModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.startTime,
      required this.endTime,
      required this.user});

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      user: User.fromJson(json['user']),
    );
  }
}

class User {
  final int? id;
  final String? name;
  final String? email;
  final String? emailVerifiedAt;
  final String? createdAt;
  final String? updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
// {
//             "id": 6,
//             "name": "Aut est laboriosam.",
//             "description": "Est sint doloribus magni saepe id asperiores aut consequuntur. Iste esse quaerat ab sint pariatur temporibus deserunt. Dolor impedit eos debitis sed quos est quisquam et.",
//             "start_time": "2024-03-16 18:53:18",
//             "end_time": "2024-04-15 17:10:24",
//             "user": {
//                 "id": 823,
//                 "name": "Cierra Koch",
//                 "email": "xzulauf@example.org",
//                 "email_verified_at": "2024-03-14T11:18:56.000000Z",
//                 "created_at": "2024-03-14T11:18:56.000000Z",
//                 "updated_at": "2024-03-14T11:18:56.000000Z"
//             }
//         },
