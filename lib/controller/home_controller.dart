import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:note_app/core/database/api/api_operation.dart';
import 'package:note_app/core/database/db/db_operation.dart';
import 'package:note_app/model/note.dart';

class HomeController extends GetxController {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  TextEditingController taskController = TextEditingController();
  TextEditingController editController = TextEditingController();
  MyDb myDb = MyDb();
  List<Note> notes = [];
  late String title;
  var value = false.obs;
  late String content;
  String urlPath = "";
  XFile? file;
  File? path;
  TextStyle style = GoogleFonts.poppins(fontSize: 25.sp);
  final ImagePicker imagePicker = ImagePicker();

  deleteTask(int id) async {
    String response = await ApiController().deleteTask(id);
    Get.back();
    update();

    print(response);
  }

  updateTask(int id) async {
    String response = await ApiController().updateTask(id, editController.text);
    Get.back();
    update();
    print(response);
  }

  addTask() async {
    String response =
        await ApiController().createTask(title: taskController.text);
    taskController.text = "";
    Get.back();
    update();

    print(response);
  }

  pickImage() async {
    file = await imagePicker.pickImage(source: ImageSource.gallery);
    path = File(file!.path);
    update();
  }

  deleteImage() {
    path = null;
    update();
  }

  bool isEmpty() {
    if (notes.length == 0)
      return true;
    else
      return false;
  }

  void addNote() async {
    title = titleController.text;
    content = contentController.text;
    if (title.isBlank!) {
      title = "بدون عنوان";
    }
    Note note = Note(
      title: title,
      details: content,
      dateTimeEdited: DateFormat("MMM dd, yyyy  HH:mm").format(DateTime.now()),
      dateTimeCreated: DateFormat("MMM dd, yyyy HH:mm").format(DateTime.now()),
      image: file == null ? null : file!.path,
      url: urlPath,
    );
    await myDb.insertData(note);
    titleController.text = "";
    contentController.text = "";
    if (file != null) {
      path = null;
    }
    getAllNotes();
    Get.back();
  }

  void deleteNote(int id) async {
    Note note = Note(
      id: id,
    );
    await myDb.deleteNote(note);
    getAllNotes();
  }

  void deleteAllNotes() async {
    await myDb.deleteAllNotes();
    getAllNotes();
  }

  void updateNote(int id, String dTCreated) async {
    title = titleController.text;
    content = contentController.text;
    Note note = Note(
      id: id,
      title: title,
      details: content,
      image: file == null ? null : file!.path,
      url: urlPath,
      dateTimeEdited: DateFormat("MMM dd, yyyy HH:mm").format(DateTime.now()),
      dateTimeCreated: dTCreated,
    );
    await myDb.updateNote(note);
    titleController.text = "";
    contentController.text = "";
    if (file != null) {
      path = null;
    }
    getAllNotes();
    Get.back();
  }

  void getAllNotes() async {
    notes = await myDb.readNotes();
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllNotes();
  }
}
