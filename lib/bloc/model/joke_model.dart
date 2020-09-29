class Joke {
  int id;
  String type;
  String setup;
  String punchline;

  Joke({this.id, this.type, this.setup, this.punchline});

  Joke.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    setup = json['setup'];
    punchline = json['punchline'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['setup'] = this.setup;
    data['punchline'] = this.punchline;
    return data;
  }
}