import 'package:flutter/material.dart';

void main() {
  runApp(FootballLiveScoreApp());
}

class FootballLiveScoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Live Score App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> matches = [
    {
      'team1': 'Team A',
      'team2': 'Team B',
      'score': '2 - 1',
      'time': '90+3\'',
      'status': 'Full Time'
    },
    {
      'team1': 'Team C',
      'team2': 'Team D',
      'score': '0 - 0',
      'time': '45\'',
      'status': 'Half Time'
    },
    // Add more match data here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Football Live Score'),
        backgroundColor: Colors.green[700],
      ),
      body: ListView.builder(
        itemCount: matches.length,
        itemBuilder: (context, index) {
          return MatchTile(
            team1: matches[index]['team1'],
            team2: matches[index]['team2'],
            score: matches[index]['score'],
            time: matches[index]['time'],
            status: matches[index]['status'],
          );
        },
      ),
    );
  }
}


class MatchTile extends StatelessWidget {
  final String team1;
  final String team2;
  final String score;
  final String time;
  final String status;

  MatchTile({required this.team1, required this.team2, required this.score, required this.time, required this.status});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$team1 vs $team2',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  score,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  status,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}