import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wac_ecoomerce/features/authentication/repositories/authentication_client.dart';
import 'package:wac_ecoomerce/features/firestore_operations/models/product.dart';
import 'package:wac_ecoomerce/features/firestore_operations/repositories/product_client.dart';

class HomeScreen extends StatelessWidget {
  get loginUsingGmail => null;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: RaisedButton(onPressed: () async {
          // await Auth.auth.logOut();
          String x = await Auth.auth.checkUser();
          print(x);

          // if (user != null) {
          //   print(user.email);
          // }
          // PickedFile pickedFile =
          //     await ImagePicker().getImage(source: ImageSource.camera);
          // File file = File(pickedFile.path);
          // String imageUrl =
          //     await ProductClient.productClient.uploadImageToFirestorage(file);
          // if (imageUrl != null) {
          //   Product product = Product(
          //       description: 'this is dummy product, you cant buy it',
          //       imageUrl: imageUrl,
          //       name: 'product1',
          //       price: 500.0);
          //   await ProductClient.productClient.addNewProductToFirestore(product);
          // }
        }),
      ),
    );
  }
}
