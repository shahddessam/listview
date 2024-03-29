// ignore_for_file: avoid_web_libraries_in_flutter



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:listview/data/USERDATA.dart';
import 'package:listview/data/product.dart';


class DataSource {
  // static Future<List<Product>> getData() async {
  //   final response =
  //       await HttpRequest.(Uri.parse('https://dummyjson.com/products'));
  //   List<Product> productsList = [];

  //   if (response.statusCode == 200) {
  //     var jsonResponse =
  //         convert.jsonDecod(response.body) as Map<String, dynamic>;
  //     for (var item in jsonResponse['products']) {
  //       productsList.add(Product.fromJson(item));
  //     }
  //   }
  //   return productsList;
  // }

  static List<Product> products = [];
  static bool isLoading = true;
  static bool isLoadingProfile = true;

  static Future<UserDataModel?> getDataFromFirebase() async {
    try {
      String? uid = FirebaseAuth.instance.currentUser!.uid;
     
      UserDataModel? user;
     
     
       DocumentSnapshot UserA = await FirebaseFirestore.instance.collection('users').doc(uid).get();
        user = UserDataModel(email: UserA['email'],
         phone: UserA['phone'],
         name: UserA['name'],
          password: UserA['password'], 
          uid: UserA['uid']
          );

        
      
      return user;
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }

  static UserDataModel? userData;
}
