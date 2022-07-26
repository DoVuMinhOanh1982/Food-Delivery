import 'package:flutter/material.dart';
import 'package:food_delivery/constants/styles/text_styles.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/models/restaurant_model.dart';
import 'package:food_delivery/pages/food_detail/food_detail_screen.dart';
import 'package:food_delivery/widgets/cards/food_card.dart';
import 'package:food_delivery/widgets/size_config.dart';
import 'package:food_delivery/widgets/screens/top_bar_home.dart';
import 'package:provider/provider.dart';

import '../../../repositories/get_food.dart';
import '../../../repositories/get_restaurant.dart';
import '../../../notifier/food_notifier.dart';
import '../../../notifier/restaurant_notifier.dart';

class BodyExploreFood extends StatefulWidget {
  const BodyExploreFood({Key? key}) : super(key: key);

  @override
  State<BodyExploreFood> createState() => _BodyExploreFoodState();
}

class _BodyExploreFoodState extends State<BodyExploreFood> {
  void initState() {
    RestaurantNotifier restaurantNotifier =
    Provider.of<RestaurantNotifier>(context, listen: false);
    getRestaurants(restaurantNotifier);
    FoodNotifier foodNotifier =
    (Provider.of<FoodNotifier>(context, listen: false));
    getFoods(foodNotifier);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    RestaurantNotifier restaurantNotifier =
    Provider.of<RestaurantNotifier>(context);
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopBarHome(),
          const Padding(
            padding: EdgeInsets.fromLTRB(31, 20, 0, 10),
            child: Text(
              'Popular Menu',
              style: titleGroup,
            ),
          ),
          Expanded(
            child: SizedBox(
              height: SizeConfig.screenWidth! * 1,
              width: SizeConfig.screenWidth! * 1,
              child: MediaQuery.removePadding(
                removeTop: true,
                removeBottom: true,
                context: context,
                child: Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: foodNotifier.foodList.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FoodDetailScreen(
                              restaurantModel: restaurantNotifier.restaurantList[index],
                              foodModel: foodNotifier.foodList[index],
                            )
                          ),
                        );
                      },
                      child: FoodCard(
                          restaurantModel: restaurantNotifier.restaurantList[index],
                          foodModel: foodNotifier.foodList[index],
                          onPress: () {}),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
