class Candidate {
  final String name;
  final int votes;

  Candidate({required this.name, required this.votes});

  factory Candidate.fromJson(Map<String, dynamic> json) {
    return Candidate(
      name: json['name'],
      votes: json['votes'],
    );
  }
}