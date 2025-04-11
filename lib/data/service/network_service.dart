import 'package:etoken/domain/models/user.dart';

class ETokenApiService {
  Future<User> getUser() async {
    await Future.delayed(Duration(seconds: 5));
    return Future.error(Object());
    // return User(
    //   id: "ET02992",
    //   firstname: "Hassan",
    //   lastname: "Adams",
    //   phone: "08167039661",
    //   gender: "Male",
    //   address: "32, 322 Road, Gwarinpa, FCT, Abuja",
    //   email: 'devhassan.org@gmail.com',
    // );
  }
}
