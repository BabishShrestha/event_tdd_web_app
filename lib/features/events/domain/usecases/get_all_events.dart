import 'package:event_example_web_app/features/events/domain/repositories/event_repo.dart';

class GetAllEvents {
  final EventRepo eventRepo;

  GetAllEvents(this.eventRepo);

  // Future<void> call() async {
  //   return await eventRepo.getAllEvents();
  // }
}
