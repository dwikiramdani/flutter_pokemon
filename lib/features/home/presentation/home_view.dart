import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon/features/home/data/models/book_item.dart';
import 'package:flutter_pokemon/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_pokemon/features/home/presentation/home_detail_view.dart';
import 'package:flutter_pokemon/shared/widgets/epub_view.dart';
import 'package:flutter_pokemon/shared/widgets/pdf_view.dart';
import 'package:flutter_pokemon/shared/helper/json_utils.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // Sample list of items
  List<Book> itemList = [
    Book(
      title: "Buku PDF",
      href:
          "https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf",
      type: "pdf",
    ),
    Book(
      title: "Buku EPUB",
      href:
          "https://vocsyinfotech.in/envato/cc/flutter_ebook/uploads/22566_The-Racketeer---John-Grisham.epub",
      type: "epub",
    )
  ];

  final List<Product> products = [
    Product(
      name: 'Product 1',
      description: 'Description for Product 1',
      price: 19.99,
      imageUrl: 'http://via.placeholder.com/160x240',
    ),
    Product(
      name: 'Product 2',
      description: 'Description for Product 1',
      price: 19.99,
      imageUrl: 'http://via.placeholder.com/160x240',
    ),
    // Add more products as needed
  ];

  // Controller for the text field
  TextEditingController textFieldController = TextEditingController();

  @override
  void initState() {
    context.read<HomeBloc>().fetchPortalItems();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Function to handle the item tap
  void handleItemTap(String sourceUrl, String type) {
    if (type == "pdf") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyPdfView(
            sourceUrl: sourceUrl,
          ),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyEpubView(
            sourceUrl: sourceUrl,
          ),
        ),
      );
    }
    print('Tapped on $sourceUrl');
    // Add your logic for item tap here
  }

  // Function to handle the confirmation button tap
  void handleConfirmation() {
    print('Confirmed: ${textFieldController.text}');
    // Add your logic for confirmation here
    // For example, you can add the text to the list
    setState(() {
      // Clear the text field
      textFieldController.clear();
    });
    // Close the text field
    Navigator.of(context).pop();
  }

  Widget buildItemCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black12, width: 2)),
      child: Row(
        children: [
          CachedNetworkImage(
            height: 120,
            width: 72,
            fit: BoxFit.fill,
            imageUrl: "http://via.placeholder.com/160x240",
            placeholder: (context, url) => new CircularProgressIndicator(),
            errorWidget: (context, url, error) => new Icon(Icons.error),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Title"),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse id mattis orci. Phasellus molestie justo sit amet tincidunt aliquet. Proin a sem vel odio eleifend ornare",
                  maxLines: 3,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItemCardWithButton(Item item) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black12, width: 2)),
      child: Column(
        children: [
          Row(
            children: [
              CachedNetworkImage(
                height: 160,
                width: 96,
                fit: BoxFit.fill,
                imageUrl: item.images.first.href,
                placeholder: (context, url) => new CircularProgressIndicator(),
                errorWidget: (context, url, error) => new Icon(Icons.error),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.title!,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      item.subtitle!,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black38,
                      ),
                    ),
                    Text(
                      item.vendor.title,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black38,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Dimiliki",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "0",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Eceran",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "${item.offers.first.price.idr.net}",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.greenAccent),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          "Tambah ke Keranjang",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildListOfItem(List<Item> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        Item item = items[index];
        return ListTile(
          title: buildItemCardWithButton(item),
          onTap: isShowItemOwned
              // ? () {
              //     Navigator.of(context).push(
              //       MaterialPageRoute(
              //         builder: (context) => HomeDetailView(bookId: item.id),
              //       ),
              //     );
              //   }
              ? () => handleItemTap(item.href!, item.type!)
              : () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomeDetailView(bookId: item.id),
                    ),
                  );
                },
        );
      },
    );
  }

  Widget buildListOfItemOwned() {
    return ListView.builder(
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        Book item = itemList[index];
        return ListTile(
          title: buildItemCard(),
          onTap: () => handleItemTap(item.href!, item.type!),
        );
      },
    );
  }

  bool isShowItemOwned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OpenAPI Home'),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeDataLoadedState) {
            return buildListOfItem(state.data);
          }
          if (state is HomeOwnedDataLoadedState) {
            return buildListOfItemOwned();
          }
          return Container();
        },
        listener: (context, state) {
          if (state is HomeDataLoadedState) {
            setState(() {
              isShowItemOwned = false;
            });
            print("state is HomeDataLoadedState");
          }
          if (state is HomeOwnedDataLoadedState) {
            setState(() {
              isShowItemOwned = true;
            });
            print("state is HomeOwnedDataLoadedState");
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            // UserAccountsDrawerHeader(
            //   accountName: Text('John Doe'),
            //   accountEmail: Text('john.doe@example.com'),
            //   currentAccountPicture: CircleAvatar(
            //     backgroundColor: Colors.white,
            //     child: Icon(Icons.person),
            //   ),
            // ),
            ListTile(
              title: Text('Explore Book'),
              onTap: () {
                context.read<HomeBloc>().fetchPortalItems();
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('My Book'),
              onTap: () {
                context.read<HomeBloc>().fetchOwnedItems();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Open URL'),
                content: TextField(
                  controller: textFieldController,
                  decoration: InputDecoration(hintText: 'Enter URL'),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      // Close the dialog
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: handleConfirmation,
                    child: Text('Confirm'),
                  ),
                ],
              );
            },
          );
        },
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ),
    );
  }
}

class Book {
  String? title;
  String? href;
  String? type;

  Book({
    this.title,
    this.href,
    this.type,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: getJsonValueAsString(json, "title"),
      href: getJsonValueAsString(json, "href"),
      type: getJsonValueAsString(json, "type"),
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'href': href, 'type': type};
  }
}
