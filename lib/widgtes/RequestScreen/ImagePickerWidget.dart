import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePickerWidget extends StatefulWidget {
  final Function onClick;
  final String name;

  ImagePickerWidget(this.name,this.onClick);

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState(onClick,name);
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final Function onClick;
  final String name;

  _ImagePickerWidgetState(this.onClick, this.name);

  @override
  File _image;                             //for image
  final picker = ImagePicker();

  Future getImage() async {














    final pickedFile = await picker.getImage( source: ImageSource.gallery, imageQuality: 50);
  /*  final pickedFile = await  ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );*/
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        onClick(_image);
        print("\n\nimage ");

        print( (_image.readAsBytesSync()));

      } else {
        print('No image selected.');
      }
    });
  }
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(name),
            Container(
              width: 50,
              child: RaisedButton(
                onPressed: getImage,
                child: Icon(Icons.add_a_photo),
              ),
            ),
            _image == null
                ? Text('لم تختار')
                : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(height:40,width: 40,child: Image.file(_image)),
                ),

          ],
        ),
      );
  }
}
