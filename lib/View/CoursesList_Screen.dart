

import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../Constants.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> items = List.generate(20, (index) => 'Item $index');
  late Future<List<dynamic>> _futureProducts;

  @override
  void initState() {
    super.initState();
    _futureProducts = fetchProducts();
  }

  Future<List<dynamic>> fetchProducts() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products?limit=5'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.Primarycolor,
      appBar: AppBar(
        backgroundColor: AppConstant.whiteColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_outlined,color: Colors.black,),

        ),
        centerTitle: true,
        title: const Text('Academy',style:TextStyle(color: Colors.black)),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final product = snapshot.data![index];
                return SlideInAnimation(
                  delay: Duration(milliseconds: 100 * index),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    child: ListTile(
                      tileColor: AppConstant.whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0), // Circular border radius
                  
                      ),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          product['image'],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(product['title'],style: const TextStyle(color:Colors.black,fontWeight: FontWeight.bold),),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              RatingBar.builder(
                                initialRating: product['rating']['rate'],
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 13,
                                itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {

                                },
                              ),
                              Text('(${product['rating']['rate']})',style: const TextStyle(fontSize: 10),),
                              Text('(${product['rating']['count']})',style: const TextStyle(fontSize: 10),),
                            ],
                          )
                  
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Spacer(),
                          Text('\$${product['price']}',style: const TextStyle(color:Colors.black,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      onTap: () {
                        // Handle onTap event
                      },
                  
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
class SlideInAnimation extends StatefulWidget {
final Duration delay;
final Widget child;

const SlideInAnimation({super.key, required this.delay, required this.child});

@override
_SlideInAnimationState createState() => _SlideInAnimationState();
}

class _SlideInAnimationState extends State<SlideInAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    _animation = Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      });
    Future.delayed(widget.delay, () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }
}
