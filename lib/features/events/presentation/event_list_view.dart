import 'dart:convert';
import 'dart:developer';

import 'package:event_example_web_app/core/api/event_repo.dart';
import 'package:event_example_web_app/features/events/data/models/event_model.dart';
import 'package:flutter/material.dart';

class EventListView extends StatelessWidget {
  const EventListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event List'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: FutureBuilder(
                future: EventRepositoryImpl().getEventsWithoutUsingModel(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }
                  if (snapshot.hasData) {
                    final List<dynamic>? dataList = snapshot.data;
                    log('data list ${snapshot.data}');
                    if (dataList != null) {
                      return ListView.builder(
                        itemCount: dataList.length,
                        itemBuilder: (context, index) {
                          final post = dataList[index];
                          return ListTile(
                            title: Text('${post['name']}'),
                            subtitle: Text('${post['user']['name']}'),
                            // subtitle: Text(post['body']),
                          );
                        },
                      );
                    }
                  }
                  return const Center(
                    child: Text('No data available'),
                  );
                }),
          ),
          SizedBox(
            height: 200,
            child: FutureBuilder(
                future: EventRepositoryImpl().getEvents(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }
                  if (snapshot.hasData) {
                    final List<EventModel>? dataList = snapshot.data;
                    log('data list ${snapshot.data}');
                    if (dataList != null) {
                      return ListView.builder(
                        itemCount: dataList.length,
                        itemBuilder: (context, index) {
                          final post = dataList[index];
                          return ListTile(
                            title: Text('${post.name}'),
                            subtitle: Text('${post.description}'),
                            // subtitle: Text(post['body']),
                          );
                        },
                      );
                    }
                  }
                  return const Center(
                    child: Text('No data available'),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
