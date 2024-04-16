import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:event_example_web_app/features/events/data/models/event_model.dart';

class EventRepositoryImpl {
  final Dio _dio = Dio();
  EventRepositoryImpl();
  Future<List<EventModel>> getEvents() async {
    try {
      final response = await _dio.get('http://192.168.80.243:8000/api/events');
      if (response.statusCode == 200) {
        final List<EventModel> data =
            response.data['data'].map<EventModel>((json) {
          return EventModel.fromJson(json);
        }).toList();

        log('data ${data[0].description}');
        return data;
      }
      return [];
    } catch (e) {
      log('error $e');
      return [];
    }
  }

  Future<List<dynamic>> getEventsWithoutUsingModel() async {
    try {
      final response = await _dio.get('http://192.168.80.243:8000/api/events');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        log('data ${data[0]['description']}');
        return data;
      }
      return [];
    } catch (e) {
      log('error $e');
      return [];
    }
  }

  Future<Response> post(String url, dynamic data) async {
    return await _dio.post(url, data: data);
  }

  Future<Response> put(String url, dynamic data) async {
    return await _dio.put(url, data: data);
  }

  Future<Response> delete(String url) async {
    return await _dio.delete(url);
  }
}
