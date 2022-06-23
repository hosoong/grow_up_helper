import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../main.dart';
import 'survey_widgets.dart';


/// This is the stateless widget that the main application instantiates.
class ProfilePage extends StatefulWidget {
  ProfilePage({required this.appState});

  ApplicationState appState;

  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              height: 180,
              child: new ListView(
                children:
                ListTile.divideTiles(
                  context:context,
                tiles: [
                  new ListTile(
                    title: new Text('사진 찍기', style: GoogleFonts.notoSans(
                        color: Color(0xff59597C), fontSize: 18, fontWeight: FontWeight.w500)),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                  new ListTile(
                      title: new Text('앨범에서 선택', style: GoogleFonts.notoSans(
                          color: Color(0xff59597C), fontSize: 18, fontWeight: FontWeight.w500)),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    title: new Text('기본 이미지로 설정', style: GoogleFonts.notoSans(
                        color: Color(0xff59597C), fontSize: 18, fontWeight: FontWeight.w500)),
                    onTap: () {
                      _imgFromDefault();
                      Navigator.of(context).pop();
                    },
                  ),
                ]).toList(),
              ),
            ),
          );
        }
    );
  }

  final _formKey = GlobalKey<FormState>(debugLabel: '_ProfilePageState');

  final _nickname = TextEditingController();

  ImagePicker _picker = ImagePicker();
  XFile? _image;
  bool _validateImage = true;
  bool _default = false;

  bool validateImage() {
    if (_image != null || _default == true) {
      setState(() {_validateImage = true;});
    }
    else {
      setState(() {_validateImage = false;});
    }
    return _validateImage;
  }

  _imgFromCamera() async {
    XFile? image = await _picker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    );

    setState(() {
      _image = image;
      _default = false;
    });
  }

  _imgFromGallery() async {
    XFile? image = await _picker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _image = image;
      _default = false;
    });
  }

  _imgFromDefault() {

    setState((){
      _image = null;
      _default = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : true,
        body: Container(
            padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
            color: Colors.white,
            child: Form(
                key: _formKey,
                child: ListView(children: [Column(
                  children: [
                    SizedBox(height: 90),
                    Center(child: Text('프로필 입력', style: TextStyle(color: Color(0xff5a6bff), fontFamily: 'GmarketSans', fontSize: 18, fontWeight: FontWeight.w500))),
                    SizedBox(height: 44),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          _showPicker(context);
                          },
                        child: CircleAvatar(
                          radius: 65,
                          child: _image != null
                              ? Container(
                              width: 190.0,
                              height: 190.0,
                              decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: new FileImage(File(_image!.path))
                                  )
                              ))
                              : Container(
                            width: 190.0,
                            height: 190.0,
                            decoration: BoxDecoration(
                                color: Color(0xffb9c1d9),
                                shape: BoxShape.circle),
                            child: Icon(
                                _default == true ? Icons.person : Icons.camera_alt,
                                color: Colors.white,
                                size: 54
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility (
                      visible: !_validateImage,
                      child: Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border(top: BorderSide(width: 1, color: Colors.red))
                        ),
                        child: SizedBox(width: 150),
                        //child: Text('사진을 선택하세요!', style: TextStyle(color: Colors.red, fontSize: 12)),
                      )
                    ),
                    SizedBox(height: 40),
                    Center(child: Text('사용하실 닉네임을 입력하세요.', style: TextStyle(fontFamily: 'GmarketSans', fontSize: 13, fontWeight: FontWeight.w500))),
                    SizedBox(height: 12),
                    ProfileField('닉네임은 최대 10자까지 설정 가능합니다', _nickname, defaultValidator, true, true),
                    SizedBox(height: 90),
                        BlueButton(
                          width: 194,
                            height: 40,
                            text: '프로필 설정하기',

                            onPressed: () async {
                              bool flag1 = _formKey.currentState!.validate();
                              bool flag2 = validateImage();
                              var downloadURL = null;
                              if (flag1 && flag2) {
                                if (_default == false){
                                  String filePath = _image!.path;
                                  File file = File(filePath);

                                  try {
                                    await firebase_storage.FirebaseStorage.instance
                                        .ref('profile/'+widget.appState.userId!+'.png')
                                        .putFile(file);
                                    var ref = firebase_storage.FirebaseStorage.instance.ref().child('profile/'+widget.appState.userId!+'.png');
                                    downloadURL = await ref.getDownloadURL();
                                  } on firebase_core.FirebaseException catch (e) {
                                    print('profile image upload error');
                                  }
                                }

                                Map<String, dynamic> info = {
                                  'phase': 'survey1intro',
                                  'nickname': _nickname.text,
                                  'profileURL': downloadURL,
                                };

                                widget.appState.writeDB(info);

                                widget.appState.state = 'survey1intro';
                              }
                              else {
                                showDialog<void>(
                                    context: context,
                                    builder: (context) {
                                      return AlertPopup();
                                    }
                                );
                              }
                            }
                        )
                  ],
                )])
            )
        )
    );
  }
}

