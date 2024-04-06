// notes for Sachin

// add a save button below the Cantidates list

// user can select multiple candidates i think so convert the vote button to a checkbox kinda thingy

// on submit we have to save the candidates the user voted in the database
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';

class VotingScreen extends StatelessWidget {
  final List<String> candidates = [
    'Candidate 1',
    'Candidate 2',
    'Candidate 3',
    'Candidate 4',
    'Candidate 5',
    'Candidate 6',
    'Candidate 7',
    'Candidate 8',
    'Candidate 9',
    'Candidate 10',
  ];

   VotingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cantidates'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/results');
            },
            icon: const Icon(Icons.bar_chart),
          )
        ],
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
                title: Text(candidates[index]),
                trailing: ElevatedButton(
                  onPressed: () {
                    _voteForCandidate(context, candidates[index]);
                  },
                  child: const Text('Vote'),
                ));
          },
          itemCount: candidates.length),
    );
  }

  void _voteForCandidate(BuildContext context, String candidateName) {
    // final databaseReference = FirebaseDatabase.instance.ref();
    // Implement your voting logic here
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Vote Confirmation'),
          content: Text('Are you sure you want to vote for $candidateName?'),
          actions: [
            TextButton(
              onPressed: () async {
                // Implement voting logic with Firebase integration
                final db = FirebaseDatabase.instance;
                final votesRef = db.ref('candidates/$candidateName');

                try {
                  await votesRef.set(ServerValue.increment(1));
                  print('Vote recorded successfully!');
                } catch (e) {
                  print('Error updating vote: $e');
                }

                Navigator.pushNamed(context, '/results'); // Close the dialog
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }
}
