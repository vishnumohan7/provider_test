import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/provider/product_count.dart';
import 'package:provider_demo/provider/products_provider.dart';
import 'package:provider_demo/widgets/single_product.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductCount(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Products"),
          backgroundColor: Colors.lightGreen,
        ),
        body: FutureBuilder(
          future: context.read<ProductsProvider>().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 250),
                itemCount: 8,
                itemBuilder: (context, index) {
                  print(snapshot.data);
                  return Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: SingleProduct(
                      imgUrl: snapshot.data![index].image.toString(),
                      title: snapshot.data![index].title.toString(),
                      price: snapshot.data![index].price.toString(),
                      rating: snapshot.data![index].rating!.rate.toString(),
                      ratingCount:
                          snapshot.data![index].rating!.count.toString(),
                      category: snapshot.data![index].category.toString(),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
