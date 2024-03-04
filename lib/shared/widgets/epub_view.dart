import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vocsy_epub_viewer/epub_viewer.dart';

class MyEpubView extends StatefulWidget {
  const MyEpubView({super.key, this.sourceUrl});

  final String? sourceUrl;
  @override
  _MyEpubViewState createState() => _MyEpubViewState();
}

class _MyEpubViewState extends State<MyEpubView> {
  bool loading = false;
  Dio dio = Dio();
  String filePath = "";

  @override
  void initState() {
    download();
    super.initState();
  }

  download() async {
    if (Platform.isAndroid || Platform.isIOS) {
      String? firstPart;
      final deviceInfoPlugin = DeviceInfoPlugin();
      final deviceInfo = await deviceInfoPlugin.deviceInfo;
      final allInfo = deviceInfo.data;
      if (allInfo['version']["release"].toString().contains(".")) {
        int indexOfFirstDot = allInfo['version']["release"].indexOf(".");
        firstPart = allInfo['version']["release"].substring(0, indexOfFirstDot);
      } else {
        firstPart = allInfo['version']["release"];
      }
      int intValue = int.parse(firstPart!);
      if (intValue >= 13) {
        await startDownload();
        onOpenEpub();
      } else {
        if (await Permission.storage.isGranted) {
          await Permission.storage.request();
          await startDownload();
          onOpenEpub();
        } else {
          await startDownload();
          onOpenEpub();
        }
      }
    } else {
      loading = false;
    }
  }

  void onOpenEpub() async {
    print("=====filePath======$filePath");
    if (filePath == "") {
      download();
    } else {
      VocsyEpub.setConfig(
        themeColor: Theme.of(context).primaryColor,
        identifier: "iosBook",
        scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
        allowSharing: true,
        enableTts: true,
        nightMode: true,
      );

      // get current locator
      VocsyEpub.locatorStream.listen((locator) {
        print('LOCATOR: $locator');
      });

      VocsyEpub.open(
        filePath,
        lastLocation: EpubLocator.fromJson({
          "bookId": "2239",
          "href": "/OEBPS/ch06.xhtml",
          "created": 1539934158390,
          "locations": {
            "cfi": "epubcfi(/0!/4/4[simple_book]/2/2/6)"
          }
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Vocsy Plugin E-pub example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              Text('Downloading.... E-pub'),
            ],
          )
        ),
      ),
    );
  }

  startDownload() async {
    Directory? appDocDir = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();

    String path = appDocDir!.path + '/sample.epub';
    File file = File(path);

    if (!File(path).existsSync()) {
      await file.create();
      await dio.download(
        widget.sourceUrl!,
        path,
        deleteOnError: true,
        onReceiveProgress: (receivedBytes, totalBytes) {
          setState(() {
            loading = true;
          });
        },
      ).whenComplete(() {
        setState(() {
          loading = false;
          filePath = path;
        });
      });
    } else {
      setState(() {
        loading = false;
        filePath = path;
      });
    }
  }
}
