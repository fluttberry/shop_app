// ignore_for_file: no_leading_underscores_for_local_identifiers, unnecessary_string_interpolations

import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';
import 'package:shop_app/app/constants/presentation/auth/auth_snack_bar_widget/my_message_handler.dart';
import 'package:shop_app/app/utilities/categ_list.dart';
import 'package:path/path.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  late double price;
  late int quantity;
  late String productName;
  late String productDescription;
  String mainCategValue = 'select category';
  String subCategValue = 'subcategory';
  List<String> subCategoryList = [];
  final ImagePicker _picker = ImagePicker();
  List<XFile> imagesFileList = [];
  List<String> imagesUrlList = [];
  dynamic _pickedImageError;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            reverse: true,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          color: AppColors.blueGrey.shade100,
                        ),
                        height: size.height * 0.30,
                        width: size.width * 0.5,
                        child: Center(
                          child: previewImages(),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.28,
                        width: size.width * 0.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  '* select main category',
                                  style: TextStyle(color: AppColors.red),
                                ),
                                DropdownButton(
                                  iconSize: 40,
                                  iconEnabledColor: AppColors.red,
                                  dropdownColor: AppColors.yellow.shade400,
                                  value: mainCategValue,
                                  items: maincateg
                                      .map<DropdownMenuItem<String>>((value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? value) {
                                    selectedMainCateg(value);
                                  },
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text(
                                  '* select subcategory',
                                  style: TextStyle(color: AppColors.red),
                                ),
                                DropdownButton(
                                  iconSize: 40,
                                  iconEnabledColor: AppColors.red,
                                  iconDisabledColor: AppColors.black,
                                  dropdownColor: AppColors.yellow.shade400,
                                  value: subCategValue,
                                  items: subCategoryList
                                      .map<DropdownMenuItem<String>>((value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? value) {
                                    setState(() {
                                      subCategValue = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                    child: Divider(
                      color: Colors.yellow,
                      thickness: 1.5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: size.width * 0.45,
                      child: TextFormField(
                        // onChanged: (value) {},
                        onSaved: (value) {
                          price = double.parse(value!);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter price';
                          } else if (value.isValidPrice() != true) {
                            return 'Invalid Price';
                          }
                          return null;
                        },
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        decoration: inputDecoration.copyWith(
                          labelText: 'price',
                          hintText: 'price .. \$',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: TextFormField(
                        onSaved: (value) {
                          quantity = int.parse(value!);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter quantity';
                          } else if (value.isValidQuantity() != true) {
                            return 'not valid quantity';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: inputDecoration.copyWith(
                          labelText: 'Quantity',
                          hintText: 'Add Quantity',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        onSaved: (value) {
                          productName = value!;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter product name';
                          } else {
                            return null;
                          }
                        },
                        maxLength: 100,
                        maxLines: 3,
                        decoration: inputDecoration.copyWith(
                          labelText: 'product name',
                          hintText: 'Enter product name',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        onSaved: (value) {
                          productDescription = value!;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter description ';
                          } else {
                            return null;
                          }
                        },
                        maxLength: 800,
                        maxLines: 5,
                        decoration: inputDecoration.copyWith(
                          labelText: 'product description',
                          hintText: ' Enter product description ',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: FloatingActionButton(
                onPressed: imagesFileList.isEmpty
                    ? () {
                        pickProductImages();
                      }
                    : () {
                        setState(() {});
                        imagesFileList = [];
                      },
                backgroundColor:
                    imagesFileList.isEmpty ? Colors.yellow : Colors.red,
                child: imagesFileList.isEmpty
                    ? const Icon(
                        Icons.photo_library,
                        color: Colors.black,
                      )
                    : const Icon(
                        Icons.delete_forever,
                        color: Colors.black,
                      ),
              ),
            ),
            FloatingActionButton(
              backgroundColor: Colors.yellow,
              onPressed: () {
                uploadProduct();
              },
              child: const Icon(
                Icons.upload,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
  void uploadProduct() async {
    if (mainCategValue != 'select category' || subCategValue != 'subcategory') {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        if (imagesFileList.isNotEmpty) {
          try {
            for (var image in imagesFileList) {
              firebase_storage.Reference reference = firebase_storage
                  .FirebaseStorage.instance
                  .ref('products/$mainCategValue/${basename(image.path)}');
              await reference.putFile(File(image.path)).whenComplete(() async {
                await reference.getDownloadURL().then((value) {
                  imagesUrlList.add(value);
                });
              });
            }
          } catch (e) {
            log('$e');
          }
          log('iamages picked');
          log('$price');
          log('$quantity');
          log('$productName');
          log('$productDescription');
          setState(() {
            imagesFileList = [];
            mainCategValue = 'select category';
            subCategValue = 'subcategory';
          });
          _formKey.currentState!.reset();
        } else {
          MyMessageHandler.showSnackBar(_scaffoldKey, "Please pick images");
        }
      } else {
        MyMessageHandler.showSnackBar(_scaffoldKey, "Please fill all fields");
      }
    } else {
      MyMessageHandler.showSnackBar(_scaffoldKey, "Please select category");
    }
  }

  Widget previewImages() {
    if (imagesFileList.isNotEmpty) {
      return ListView.builder(
          itemCount: imagesFileList.length,
          itemBuilder: (context, index) {
            return Image.file(
              File(imagesFileList[index].path),
            );
          });
    } else {
      return const Text(
        'You have not \n \n picked images yet !',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      );
    }
  }

  void pickProductImages() async {
    try {
      final _pickedImage = await _picker.pickMultiImage(
        imageQuality: 95,
        maxHeight: 300,
        maxWidth: 300,
      );

      setState(() {
        imagesFileList = _pickedImage;
      });
    } catch (e) {
      setState(() {
        _pickedImageError = e;
      });
      log(_pickedImageError);
    }
  }

  void selectedMainCateg(String? value) {
    if (value == 'select category') {
      subCategoryList = [];
    } else if (value == 'men') {
      subCategoryList = men;
    } else if (value == 'women') {
      subCategoryList = women;
    } else if (value == 'electronics') {
      subCategoryList = electronics;
    } else if (value == 'accessories') {
      subCategoryList = accessories;
    } else if (value == 'shoes') {
      subCategoryList = shoes;
    } else if (value == 'home & garden') {
      subCategoryList = homeandgarden;
    } else if (value == 'beauty') {
      subCategoryList = beauty;
    } else if (value == 'kids') {
      subCategoryList = kids;
    } else if (value == 'bags') {
      subCategoryList = bags;
    }
    setState(() {
      mainCategValue = value!;
      subCategValue = 'subcategory';
    });
  }
}

var inputDecoration = InputDecoration(
  labelText: 'price',
  hintText: 'price .. \$',
  labelStyle: const TextStyle(color: Colors.purple),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.yellow,
      width: 1,
    ),
    borderRadius: BorderRadius.circular(10),
  ),
  focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.blueAccent,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(10)),
);

extension PriceValidator on String {
  bool isValidPrice() {
    return RegExp(r'^((([1-9][0-9]*[\.]*)||([0][\.]))([0-9]{1,2}))$')
        .hasMatch(this);
  }
}

extension QuantityValidator on String {
  bool isValidQuantity() {
    return RegExp(r'^[1-9][0-9]*$').hasMatch(this);
  }
}
