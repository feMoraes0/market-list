class Item {
  bool status;
  String name;

  Item({this.name, this.status});

  String getName() => this.name;
  bool getStatus() => this.status;

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'status': (this.status) ? 1 : 0,
    };
  }
}
