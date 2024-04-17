import 'package:equatable/equatable.dart';
import 'package:event_example_web_app/features/events/data/models/event_model.dart';

class Event extends Equatable {
  final int? id;
  final String? name;
  final String? description;
  final String? startTime;
  final String? endTime;
  final User? user;

  const Event({
    required this.id,
    required this.name,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.user,
  });

  @override
  List<Object?> get props => [id, name, description, startTime, endTime, user];
}
