class UserState {
  late String name;
  late String email;
  late String address;

  UserState() {
    name = "";
    email = "";
    address = "";
  }

  UserState.init(this.name, this.email, this.address);
}
