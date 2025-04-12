import 'package:etoken/domain/models/user.dart';
import 'package:dio/dio.dart';


final _dio = Dio();

class ETokenApiService {
  Future<User> getUser() async {
    final response = await _dio.get("https://dart.dev", onReceiveProgress: (received, total) => {
      print('recived: $received, total: $total')

    });
    print(response);
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
