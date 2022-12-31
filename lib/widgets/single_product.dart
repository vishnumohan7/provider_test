import 'package:flutter/material.dart';

class SingleProduct extends StatefulWidget {
  String imgUrl;
  String title;
  String price;
  String rating;
  String ratingCount;
  String category;

  SingleProduct(
      {Key? key,
      required this.imgUrl,
      required this.title,
      required this.price,
      required this.category,
      required this.rating,required this.ratingCount
      })
      : super(key: key);

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  int productCount = 0;

  void productIncrement() {
    setState(() {
      productCount++;
    });
  }

  void productDecrement() {
    setState(() {
      productCount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 400,
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    border: Border(),
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: NetworkImage(widget.imgUrl),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(widget.title),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text("Price: ${widget.price}"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.lightGreen,
                          context: (context),
                          builder: (context) {
                            return SizedBox(
                              height: 250,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Product Rating: ${widget.rating}",style: TextStyle(fontSize: 16,color: Colors.white),),
                                  Text("Number of Ratings: ${widget.ratingCount}",style: TextStyle(fontSize: 16,color: Colors.white),),
                                  Text("Category: ${widget.category}",style: TextStyle(fontSize: 16,color: Colors.white),)
                                ],
                              ),
                            );
                          });
                    },
                    child: Text("View")),
                IconButton(
                    onPressed: () {
                      productIncrement();
                    },
                    icon: Icon(Icons.add_circle_outline)),
                Text("$productCount"),
                IconButton(
                    onPressed: () {
                      productDecrement();
                    },
                    icon: Icon(Icons.remove_circle_outline))
              ],
            )
          ],
        ),
      ),
    );
  }
}
