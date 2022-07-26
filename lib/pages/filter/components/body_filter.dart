import 'package:flutter/material.dart';
import 'package:food_delivery/constants/styles/text_styles.dart';
import 'package:food_delivery/widgets/buttons/button_next_custom.dart';
import 'package:food_delivery/widgets/buttons/button_filter_text.dart';
import 'package:food_delivery/widgets/size_config.dart';
import 'package:food_delivery/widgets/screens/top_bar_home.dart';

class BodyFilter extends StatefulWidget {
  const BodyFilter({Key? key}) : super(key: key);

  @override
  State<BodyFilter> createState() => _BodyFilterState();
}

class _BodyFilterState extends State<BodyFilter> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const TopBarHome(),
              Padding(
                padding: const EdgeInsets.fromLTRB(31, 20, 0, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Type', style: titleGroup),
                    Row(
                      children: const [
                        ButtonText(textFilter: 'Restaurant'),
                        SizedBox(width: 10),
                        ButtonText(textFilter: 'Menu'),
                      ],
                    ),
                    const Text('Location', style: titleGroup),
                    Row(
                      children: const [
                        ButtonText(textFilter: '1 Km'),
                        SizedBox(width: 10),
                        ButtonText(textFilter: '>10 Km'),
                        SizedBox(width: 10),
                        ButtonText(textFilter: '<10 Km'),
                      ],
                    ),
                    const Text('Food', style: titleGroup),
                    Column(
                      children: [
                        Row(
                          children: const [
                            ButtonText(textFilter: 'Cake'),
                            SizedBox(width: 10),
                            ButtonText(textFilter: 'Soup'),
                            SizedBox(width: 10),
                            ButtonText(textFilter: 'Main Course'),
                          ],
                        ),
                        Row(
                          children: const [
                            ButtonText(textFilter: 'Appetizer'),
                            SizedBox(width: 10),
                            ButtonText(textFilter: 'Dessert'),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.1,
              ),
              ButtonCustom(
                title: 'Search',
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
