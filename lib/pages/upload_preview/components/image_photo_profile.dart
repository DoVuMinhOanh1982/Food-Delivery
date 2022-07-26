import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/widgets/size_config.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';

class ImagePhotoProfile extends StatefulWidget {
  const ImagePhotoProfile({Key? key}) : super(key: key);

  @override
  State<ImagePhotoProfile> createState() => _ImagePhotoProfileState();
}

class _ImagePhotoProfileState extends State<ImagePhotoProfile> {
  String url =
      'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1';
  @override
  void initState() {
    super.initState();
    var ref = FirebaseStorage.instance
        .ref('files/${FirebaseAuth.instance.currentUser?.uid}/avatar/');
    ref.getDownloadURL().then((loc) => setState(() => url = loc));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(260),
      width: getProportionateScreenWidth(251),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          color: appBackgroundButtonColor.withOpacity(0.1),
          boxShadow: const [BoxShadow(color: Colors.white, blurRadius: 22)]),
      child: Stack(alignment: Alignment.topRight, children: [
        FancyShimmerImage(
          imageUrl: url,
          errorWidget: Image.network('https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
          boxFit: BoxFit.contain,
        ),
        GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        )
      ]),
    );
  }
}
