import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:wac_ecoomerce/features/firestore_operations/models/product.dart';

class ProductClient {
  ProductClient._();
  static final ProductClient productClient = ProductClient._();
  Firestore firestore = Firestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Future<String> uploadImageToFirestorage(File file) async {
    try {
      String fileName = file.path.split('/').last;
      String productsFolderPath = 'productsImages/$fileName';
      StorageTaskSnapshot snapshot = await firebaseStorage
          .ref()
          .child(productsFolderPath)
          .putFile(file)
          .onComplete;
      String imageUrl = await snapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (error) {
      print(error);
    }
  }

  addNewProductToFirestore(Product product) async {
    firestore.collection('products').add(product.toJson());
  }

  getAllProductsFromFirestore() async {}
}
