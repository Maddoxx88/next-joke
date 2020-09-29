class Joke {
  final int id;
  final String title;
  final String pun;

  Joke({ this.id, this.title, this.pun});

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      id: json['id'],
      title: json['setup'],
      pun: json['punchline']
    );
  }
}