abstract class Participant {
  String id;
  String name;
  String email;
  String password;

  Participant(
      {required this.id,
      required this.name,
      required this.email,
      required this.password});
}

class User extends Participant {
  User(
      {required String id,
      required String name,
      required String email,
      required String password})
      : super(id: id, name: name, email: email, password: password);
}
