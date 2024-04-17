import 'package:event_example_web_app/core/error/failures.dart';
import 'package:event_example_web_app/features/events/domain/entities/event.dart';
import 'package:fpdart/fpdart.dart';

abstract class EventRepo {
  Future<Either<Failure, List<Event>>> getAllEvents();
  Future<Either<Failure, Event>> getEventById();
  Future<Either<Failure, void>> createEvent();
  Future<Either<Failure, void>> updateEvent();
}
