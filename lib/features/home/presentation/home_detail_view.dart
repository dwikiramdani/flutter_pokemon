import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon/features/home/data/models/book_item_detail.dart';
import 'package:flutter_pokemon/features/home/presentation/bloc/home_detail_bloc.dart';

class HomeDetailView extends StatefulWidget {
  const HomeDetailView({super.key, this.bookId});
  final int? bookId;

  @override
  State<HomeDetailView> createState() => _HomeDetailViewState();
}

class _HomeDetailViewState extends State<HomeDetailView> {
  @override
  void initState() {
    context.read<HomeDetailBloc>().fetchPortalItemById(widget.bookId!);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: BlocConsumer<HomeDetailBloc, HomeDetailState>(
        builder: (context, state) {
          if (state is HomeDetailDataLoadedState) {
            final BookDetails item = state.data;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image
                  Center(
                    child: CachedNetworkImage(
                      height: 270,
                      width: 150,
                      fit: BoxFit.cover,
                      imageUrl: item.imageHighres,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Product Name
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 8),

                        // Product Description
                        Text(
                          item.subTitle,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),

                        SizedBox(height: 8),

                        // Product Price
                        Text(
                          'Price: ${item.offers.first.price.idr.base}', // Assuming the price is a double
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 8),

                        // Product Description
                        Text(
                          item.description,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),

                        SizedBox(height: 16),
                      ],
                    ),
                  ),

                  // Add more widgets for other product details as needed
                ],
              ),
            );
          }
          return Container();
        },
        listener: (context, state) {},
      ),
    );
  }
}

class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}
