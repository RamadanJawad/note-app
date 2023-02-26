import 'dart:io';
import 'package:note_app/core/function/save_data.dart';

mixin ApiHelper {
  Map<String, String> get headers {
    return {
      HttpHeaders.authorizationHeader: AppPreferences().token,
      HttpHeaders.acceptHeader: 'application/json',
    };
  }
}