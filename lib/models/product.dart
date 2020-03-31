class Product {
  int id;
  bool status;
  String name;

  Product({this.id, this.name, this.status});

  int getId() => this.id;
  String getName() => this.name;
  bool getStatus() => this.status;

  void setStatus(status) => this.status = status;

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'status': (this.status) ? 1 : 0,
    };
  }
}
