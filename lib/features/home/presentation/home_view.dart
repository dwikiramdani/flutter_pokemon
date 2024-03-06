import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon/core/network/endpoint.dart';
import 'package:flutter_pokemon/features/home/data/models/book_item.dart';
import 'package:flutter_pokemon/features/home/data/models/owned_item.dart';
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
  TextEditingController searchController = TextEditingController();
  int currentPage = 1;
  int itemsPerPage = 10;

  @override
  void initState() {
    context.read<HomeBloc>().fetchOpenApiListOfItems();
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

  Widget buildOwnedItemCard(OwnedItem item) {
    List<Widget> authorList = [];
    item.authorName.forEach((element) {
      authorList.add(Text(element));
    });
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
                imageUrl: item.coverImage,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
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
                      "Author: ${item.authorName.first}",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black38,
                      ),
                    ),
                    Text(
                      'File Size: ${item.fileSize}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black38,
                      ),
                    ),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HomeDetailView(
                              bookId: item.id,
                              displayMode: "owned",
                            ),
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          "Lihat Detail",
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
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.title,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      item.subtitle,
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
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HomeDetailView(
                              bookId: item.id,
                              displayMode: "sale",
                            ),
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          "Lihat Detail",
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

  Widget buildListOfItem(
    List<Item> items, {
    bool isNextEnable = false,
    bool isPreviousEnable = false,
    int page = 1,
  }) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        children: [
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              Item item = items[index];
              return ListTile(
                title: buildItemCardWithButton(item),
                onTap: null,
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: isPreviousEnable
                      ? () {
                          context.read<HomeBloc>().onChangePreviousPage();
                        }
                      : null,
                  child: const Text('Previous'),
                ),
                const SizedBox(width: 16),
                Text('Page $page'),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: isNextEnable
                      ? () {
                          context.read<HomeBloc>().onChangeNextPage();
                        }
                      : null,
                  child: Text('Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListOfItemOwned(List<OwnedItem> ownedItems) {
    return ListView.builder(
      itemCount: ownedItems.length,
      itemBuilder: (context, index) {
        OwnedItem item = ownedItems[index];
        return ListTile(
          title: buildOwnedItemCard(item),
          onTap: null,
        );
      },
    );
  }

  Widget buildSearchField() {
    return TextField(
      controller: searchController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Search...',
        border: InputBorder.none,
      ),
      onChanged: (value) {
        // Implement your search logic here
        // Update the UI based on search results
      },
      onSubmitted: (value) {
        context.read<HomeBloc>().fetchOpenApiListOfItems(query: value);
      },
    );
  }

  bool isShowItemOwned = false;
  bool isShowSearchField = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isShowItemOwned ? Text('OpenAPI Home') : isShowSearchField ? buildSearchField() : Text('OpenAPI Home'),
        actions: [
          IconButton(
            icon: Icon(isShowSearchField ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                isShowSearchField = !isShowSearchField;
                if (!isShowSearchField) {
                  searchController.clear();
                }
              });
            },
          ),
        ],
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingProcess) {
            return Container(
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          }
          if (state is HomeDataLoadedState) {
            return buildListOfItem(
              state.data,
              isNextEnable: state.isNextEnable,
              isPreviousEnable: state.isPreviousEnable,
              page: state.page,
            );
          }
          if (state is HomeOwnedDataLoadedState) {
            return buildListOfItemOwned(state.data);
          }
          return Container();
        },
        listener: (context, state) {
          if (state is HomeDataLoadedState) {
            setState(() {
              isShowItemOwned = false;
            });
          }
          if (state is HomeOwnedDataLoadedState) {
            setState(() {
              isShowItemOwned = true;
            });
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('John Doe'),
              accountEmail: Text('john.doe@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
              ),
            ),
            ListTile(
              title: Text('Explore Book'),
              onTap: () {
                context.read<HomeBloc>().fetchOpenApiListOfItems();
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
