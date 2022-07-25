import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/widgets/size_config.dart';

class TopBarHome extends StatefulWidget {
  const TopBarHome({Key? key}) : super(key: key);

  @override
  State<TopBarHome> createState() => _TopBarScreenState();
}

class _TopBarScreenState extends State<TopBarHome> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(31, 50, 31, 0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Find Your \nFavorite Food',
                style: TextStyle(
                    color: appTextColor,
                    fontSize: 31,
                    fontFamily: 'BentonSans Bold'),
              ),
              SizedBox(width: SizeConfig.screenHeight! * 0.1,),
              Container(
                height: 45,
                width: 45,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(20, 78, 90, 0.2), blurRadius: 15)
                    ]),
                child: const Icon(
                  Icons.notifications,
                  color: appPrimaryColor,
                  size: 32,
                ),
              ),
              
            ]
          ),
          const SizedBox(height: 20,),
          Container(
            height: SizeConfig.screenWidth! * 0.12,
            decoration:  BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    color: appPrimaryColor.withOpacity(0.5),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(20, 78, 90, 0.2), blurRadius: 15)
                    ]),
          )
        ],
      ),
    );
  }
}