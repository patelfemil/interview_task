import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/home_controller.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});



  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeController homeController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Obx(
          () => GridView.builder(
            itemCount: homeController.ProductList.length,
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
                            homeController.ProductList[index]['img'].toString(),
                            height: 100,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          homeController.ProductList[index]['price'].toString(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          homeController.ProductList[index]['name'].toString(),
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: ElevatedButton(
                            child: Text('Add to cart',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15)),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                textStyle: TextStyle(color: Colors.white)),
                            onPressed: () {
                              homeController.addProduct(
                                  id: homeController.ProductList[index]['id']);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
