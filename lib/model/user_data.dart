class UserData {
  final int id;
  final String name;
  final String username;
  final String email;

  // Constructor
  UserData(this.id, this.name, this.username, this.email);

  // แปลง JSON เป็น Object
  UserData.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        username = json['username'],
        email = json['email'];

  // แปลง Object เป็น JSON Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username' : username,
      'email' : email
    };
  }
}
