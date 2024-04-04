import 'dart:io';

import 'package:bantu/screens/UploadImagesExtra.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart' as path;
import 'package:file_picker/file_picker.dart';


class ChildPickup extends StatefulWidget {
  const ChildPickup({Key? key}) : super(key: key);

  @override
  State<ChildPickup> createState() => _ChildPickupState();
}

class _ChildPickupState extends State<ChildPickup> {
  bool _termsAccepted = false;

  bool _policeClearanceUploaded = false;
  bool _policeReportUploaded = false;

  String? _policeClearancePdfPath;
  String? _policeReportPdfPath;

  Future<void> _uploadPoliceClearance() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      String fileName = path.basename(file.path);
      setState(() {
        _policeClearancePdfPath = file.path;
        _policeClearanceUploaded = true;
      });
    }
  }

  Future<void> _uploadPoliceReport() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      String fileName = path.basename(file.path);
      setState(() {
        _policeReportPdfPath = file.path;
        _policeReportUploaded = true;
      });
    }
  }

  void _navigateToNextPage() {
    if (_termsAccepted && _policeClearanceUploaded && _policeReportUploaded) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => UploadImagesExtra()));
    } else {
      // Show a snackbar or alert indicating that all conditions must be met
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Upload Police Clearance (PDF)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: _uploadPoliceClearance,
              child: Text('Upload'),
            ),
            SizedBox(height: 20),
            Text(
              'Upload Police Report (PDF)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: _uploadPoliceReport,
              child: Text('Upload'),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: _termsAccepted,
                  onChanged: (value) {
                    setState(() {
                      _termsAccepted = value!;
                    });
                  },
                ),
                Text('I accept the terms and conditions'),
              ],
            ),
            ElevatedButton(
              onPressed: _navigateToNextPage,
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

class UploadImagesExtra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Images'),
      ),
      body: Center(
        child: Text('Upload images page'),
      ),
    );
  }
}
