import 'dart:io';

import 'package:bantu/aunthentication/login.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImagesExtra extends StatefulWidget {
  const UploadImagesExtra({super.key});

  @override
  State<UploadImagesExtra> createState() => _UploadImagesExtraState();
}

class _UploadImagesExtraState extends State<UploadImagesExtra> {
  List<XFile>? _interiorImageFiles = [];
  List<XFile>? _exteriorImageFiles = [];

  Future<void> _getImage(ImageSource source, List<XFile> imageList) async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      setState(() {
        imageList.add(image);
      });
    }
  }

  void _navigateToLogin() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Login()));
  }

  bool _areImagesReady() {
    return _interiorImageFiles != null &&
        _interiorImageFiles!.length == 6 &&
        _exteriorImageFiles != null &&
        _exteriorImageFiles!.length == 6;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60,),
              Text(
                'Upload 6 images of Car interior',
                style: TextStyle(fontSize: 20,),
              ),
              SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: _interiorImageFiles!.length + 1,
                  itemBuilder: (context, index) {
                    if (index == _interiorImageFiles!.length) {
                      if (_interiorImageFiles!.length < 6) {
                        return GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Select Image Source"),
                                  content: Container(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.7,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextButton(
                                          child: Text("Camera"),
                                          onPressed: () {
                                            _getImage(ImageSource.camera,
                                                _interiorImageFiles!);
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: Text("Gallery"),
                                          onPressed: () {
                                            _getImage(ImageSource.gallery,
                                                _interiorImageFiles!);
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            color: Colors.teal[300],
                            child: Icon(Icons.add, size: 50),
                          ),
                        );
                      } else {
                        // Return an empty container if 6 images are already uploaded
                        return Container();
                      }
                    } else {
                      return Image.file(
                        File(_interiorImageFiles![index].path),
                        fit: BoxFit.cover,
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: 20,),
              Text(
                'Upload 6 images of Car exterior',
                style: TextStyle(fontSize: 20,),
              ),
              SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: _exteriorImageFiles!.length + 1,
                  itemBuilder: (context, index) {
                    if (index == _exteriorImageFiles!.length) {
                      if (_exteriorImageFiles!.length < 6) {
                        return GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Select Image Source"),
                                  content: Container(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.7,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextButton(
                                          child: Text("Camera"),
                                          onPressed: () {
                                            _getImage(ImageSource.camera,
                                                _exteriorImageFiles!);
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: Text("Gallery"),
                                          onPressed: () {
                                            _getImage(ImageSource.gallery,
                                                _exteriorImageFiles!);
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            color: Colors.teal[300],
                            child: Icon(Icons.add, size: 50),
                          ),
                        );
                      } else {
                        // Return an empty container if 6 images are already uploaded
                        return Container();
                      }
                    } else {
                      return Image.file(
                        File(_exteriorImageFiles![index].path),
                        fit: BoxFit.cover,
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: 10,),
              Text(
                'Driver eligibility will be confirmed after 3 days',
                style: TextStyle(fontSize: 14, color: Colors.red),
              ),
              SizedBox(height: 17),

              ElevatedButton(
                onPressed: _areImagesReady() ? _navigateToLogin : null,
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  padding: EdgeInsets.symmetric(vertical: 17, horizontal: 70),
                  textStyle: TextStyle(fontSize: 17),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
