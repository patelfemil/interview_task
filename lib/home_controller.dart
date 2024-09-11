import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class HomeController extends GetxController {
  var cartItems = <Map<String, dynamic>>[].obs;

  RxInt currentValue = 0.obs;

  RxList<dynamic> ProductList = [].obs;

  Future<void> getProduct() async {
    ProductList.clear();
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('product').get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      Map<String, dynamic> data =
          querySnapshot.docs[i].data() as Map<String, dynamic>;
      data['id'] = querySnapshot.docs[i].id;
      ProductList.add(data);
    }
  }

  addProduct({required String id}) {
    FirebaseFirestore.instance.collection("AddCart").add({
      "productId": id,
    }).then((f) {
      // return ScaffoldMessenger.of(Ge).showSnackBar(SnackBar(content: Text("Add To Cart")));
    });
  }

  RxList<dynamic> cartList = [].obs;

  Future<void> getCartproduct() async {
    ProductList.clear();
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('AddCart').get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      Map<String, dynamic> data =
          querySnapshot.docs[i].data() as Map<String, dynamic>;
      data['id'] = querySnapshot.docs[i].id;
      DocumentSnapshot<Map<String, dynamic>> product = await FirebaseFirestore
          .instance
          .collection('product')
          .doc(data['productId'])
          .get();
      if (product.exists) {
        data['product'] = product.data();
      } else {
        data['product'] = [];
      }
      cartList.add(data);
    }
  }
}
