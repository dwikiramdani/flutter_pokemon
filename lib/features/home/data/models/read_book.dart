import 'package:flutter_pokemon/shared/helper/json_utils.dart';

class ReadBook {
  String baseUrl;
  String path;
  ReadBookParam params;
  String fileType;
  String watermarkCode;

  ReadBook({
    required this.baseUrl,
    required this.path,
    required this.params,
    required this.fileType,
    required this.watermarkCode,
  });

  factory ReadBook.fromJson(Map<String, dynamic> json) {
    return ReadBook(
      baseUrl: getJsonValueAsString(json, 'id'),
      path: getJsonValueAsString(json, 'title'),
      params: ReadBookParam.fromJson(getJsonValueAsJson(json, 'params')),
      fileType: getJsonValueAsString(json, 'file_type'),
      watermarkCode: getJsonValueAsString(json, 'watermark_code'),
    );
  }

}

class ReadBookParam {
  int expires;
  String signature;

  ReadBookParam({
    required this.expires,
    required this.signature,
  });

  factory ReadBookParam.fromJson(Map<String, dynamic> json) {
    return ReadBookParam(
      expires: getJsonValueAsInt(json, 'expires'),
      signature: getJsonValueAsString(json, 'signature'),
    );
  }
}