import 'package:flutter/material.dart';
import 'package:flutter_pokemon/features/home/presentation/epub_view.dart';
import 'package:flutter_pokemon/features/home/presentation/pdf_view.dart';
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
  void handleItemTap(String item, String type) {
    if (type == "pdf") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyPdfView()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyEpubView()),
      );
    }
    print('Tapped on $item');
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OpenAPI Home'),
      ),
      body: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          Book item = itemList[index];
          return ListTile(
            title: Text(item.title!),
            onTap: () => handleItemTap(item.href!, item.type!),
          );
        },
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
