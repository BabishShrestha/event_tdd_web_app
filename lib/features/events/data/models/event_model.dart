import 'package:event_example_web_app/features/events/domain/entities/event.dart';

class EventModel extends Event {
  final int? id;
  final String? name;
  final String? description;
  final String? startTime;
  final String? endTime;
  final User? user;

  const EventModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.startTime,
      required this.endTime,
      required this.user})
      : super(
            id: 0,
            name: '',
            description: '',
            startTime: '',
            endTime: '',
            user: null);

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
