import 'package:event_example_web_app/features/events/data/models/event_model.dart';
import 'package:event_example_web_app/features/events/domain/entities/event.dart';
import 'package:event_example_web_app/features/events/domain/repositories/event_repo.dart';
import 'package:event_example_web_app/features/events/domain/usecases/get_all_events.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';

class MockEventRepo extends Mock implements EventRepo {}

void main() {
  GetAllEvents usecase;
  late MockEventRepo mockEventRepo;

  setUp(() {
    mockEventRepo = MockEventRepo();
    usecase = GetAllEvents(mockEventRepo);
  });
  final tEventList = [
    Event(
      id: 1,
      name: 'name',
      description: 'description',
      startTime: 'startTime',
      endTime: 'endTime',
      user: User(
        id: 1,
        name: 'name',
        email: 'email',
        createdAt: 'createdAt',
        updatedAt: 'updatedAt',
        emailVerifiedAt: 'emailVerifiedAt',
      ),
    ),
    Event(
      id: 2,
      name: 'name',
      description: 'description',
      startTime: 'startTime',
      endTime: 'endTime',
      user: User(
        id: 1,
        name: 'name',
        email: 'email',
        createdAt: 'createdAt',
        updatedAt: 'updatedAt',
        emailVerifiedAt: 'emailVerifiedAt',
      ),
    ),
  ];
  test('should get all  events from the repository', () async {
    when(mockEventRepo.getAllEvents())
        .thenAnswer((realInvocation) async => Right(tEventList));
  });
  final result= await usecase.call();
  expect(result, Right(tEventList));
  verify(mockEventRepo.getAllEvents());
  verifyNoMoreInteractions(mockEventRepo);
}
