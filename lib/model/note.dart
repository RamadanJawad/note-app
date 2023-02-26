import 'dart:io';

import 'package:share_plus/share_plus.dart';

class Note {
  int? id;
  String? title;
  String? details;
  String? image;
  String? url;
  String? dateTimeEdited;
  String? dateTimeCreated;

  Note({
    this.id,
    this.title,
    this.details,
    this.image,
    this.url,
    this.dateTimeCreated,
    this.dateTimeEdited,
  });

  Map<String, dynamic> toMap() {
    return {
      "id":id,
      "title":title,
      "details":details,
      "imagePath":image,
      "urlPath":url,
      "dateTimeCreated":dateTimeCreated,
      "dateTimeEdited":dateTimeEdited,
    };
  }
}
