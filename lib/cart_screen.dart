import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import '../controllers/cart_controller.dart';
import 'home_controller.dart';

class cartScreen extends StatefulWidget {
  const cartScreen({super.key});

  @override
  State<cartScreen> createState() => _cartScreenState();
}

class _cartScreenState extends State<cartScreen> {
  HomeController homeController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.getCartproduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Obx(
          () => GridView.builder(
            itemCount: homeController.cartList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3, // Adjust for height-width ratio
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Navigate to product details screen
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 1,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.network(
                            homeController.cartList[index]['product']['img'].toString(),
                            height: 100,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          homeController.cartList[index]['product']['price'].toString(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),

                        ),
                        SizedBox(height: 10),
                        Text(
                          homeController.cartList[index]['product']['name'].toString(),
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: ElevatedButton(
                            child: Text('Buy',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15)),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                textStyle: TextStyle(color: Colors.white)),
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
