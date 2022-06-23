import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grow_up_helper/home/home_widgets.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../main.dart';

class CommunityWritingPage extends StatefulWidget {
  CommunityWritingPage({required this.appState});

  ApplicationState appState;

  @override
  _CommunityWritingPageState createState() => _CommunityWritingPageState();
}

class _CommunityWritingPageState extends State<CommunityWritingPage> {
  PickedFile? _image;

  Future getImageFromCam() async {
    // for camera
    var image =
    await ImagePicker.platform.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  Future getImageFromGallery() async {
    // for gallery
    var image =
    await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(7.0, 5.0, 10.0, 0.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      TextButton(
                        child: FaIcon(FontAwesomeIcons.chevronLeft,
                            color: Colors.grey),
                        onPressed: () {
                          widget.appState.state = 'communityGossip';
                        },
                      ),
                      ElevatedButton(
                        child: Text("등록",style: TextStyle(fontFamily: 'GmarketSans', fontSize: 14.37, fontWeight: FontWeight.w500, color: Colors.white)),
                        onPressed: () {
                          widget.appState.state = 'communityExample';
                        },
                        style: ElevatedButton.styleFrom(
                          primary:Color(0xFF5A6BFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
              padding: EdgeInsets.fromLTRB(22.0, 10.0, 20.0, 10.0),
              child: TextField(
                style: TextStyle(fontFamily: 'GmarketSans', fontSize: 14.37, fontWeight: FontWeight.w500, color: Color(0xff59597C)),
                decoration: new InputDecoration.collapsed(hintText: '제목을 입력하세요',),
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
              padding: EdgeInsets.fromLTRB(22.0, 10.0, 20.0, 10.0),
              child: Column(
                children:<Widget> [
                  Row(
                    children:<Widget> [
                      ElevatedButton(
                        child: Text("사진 추가",style: TextStyle(fontFamily: 'GmarketSans', fontSize: 14.37, fontWeight: FontWeight.w500, color: Color(0xff59597C))),
                        onPressed:getImageFromGallery,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                            side: BorderSide(color:Color(0xff59597C)),
                          ),
                          primary: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height:10),
                  TextField(
                    style: TextStyle(fontFamily: 'GmarketSans', fontSize: 14.37, fontWeight: FontWeight.w500, color: Color(0xff59597C)),
                    decoration: new InputDecoration.collapsed(
                        hintText: '내용을 입력하세요.'
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200.0,
                    child: Center(
                      child: _image == null
                          ? Text('')
                          : Image.file(File(_image!.path)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
