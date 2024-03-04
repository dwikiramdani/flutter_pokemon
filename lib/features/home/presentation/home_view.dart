import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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

  Widget buildItemCardWithButton() {
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
          const SizedBox(height: 8),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20)),
            onPressed: () {},
            child: const Text('Press me'),
          ),
        ],
      ),
    );
  }

  Widget buildListOfItem() {
    return ListView.builder(
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        Book item = itemList[index];
        return ListTile(
          title: buildItemCardWithButton(),
          onTap: isShowItemOwned
              ? () => handleItemTap(item.href!, item.type!)
              : () {
                  Navigator.pushNamed(
                    context,
                    '/productDetail',
                    arguments: products[index],
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
      body: isShowItemOwned ? buildListOfItemOwned() : buildListOfItem(),
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
                setState(() {
                  isShowItemOwned = false;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('My Book'),
              onTap: () {
                setState(() {
                  isShowItemOwned = true;
                });
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
