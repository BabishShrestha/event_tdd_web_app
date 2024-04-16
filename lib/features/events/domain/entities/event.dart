import 'package:equatable/equatable.dart';

class Event extends Equatable {
  final String id;
  final String name;
  final String description;
  final DateTime date;
  final String location;
  final String image;

  const Event({
    required this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.location,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, description, date, location, image];
}