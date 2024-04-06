import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:vote_ease/models/candidate.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final _database = FirebaseDatabase.instance.ref();
  List<Candidate> candidates = []; // Initialize empty list

  @override
  void initState() {
    super.initState();
    _loadCandidates();
  }

  void _loadCandidates() {
    _database.child('candidates').onValue.listen((DatabaseEvent event) {
      final candidatesData = event.snapshot.value as Map<String, dynamic>?;
      if (candidatesData != null) {
        setState(() {
          candidates = candidatesData.entries.map((entry) => Candidate(
                name: entry.key,
                votes: entry.value as int, 
              )).toList();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Candidate Votes')),
      body: candidates.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: candidates.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(candidates[index].name),
                  trailing: Text('Votes: ${candidates[index].votes}'),
                );
              },
            ),
    );
  }
}


