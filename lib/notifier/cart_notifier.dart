import 'dart:collection';

import 'package:flutter/material.dart';

import '../models/food_database.dart';

class CartNotifier extends ChangeNotifier {
  List<FoodDataBase> _cartFoodList = [];
  UnmodifiableListView<FoodDataBase> get cartFoodList =>
      UnmodifiableListView(_cartFoodList);
  FoodDataBase? _currentFood;

  set cartFoodList(List<FoodDataBase> foodList) {
    _cartFoodList = foodList;
    notifyListeners();
  }

  set currentFood(FoodDataBase food) {
    _currentFood = food;
    notifyListeners();
  }
  get foodNamesQuantity => _cartFoodList.map((e) => e.foodName).toList();
  get quantity => _cartFoodList.map((e) => e.quantity).toList();
  removeFromCart(FoodDataBase food) {
    _cartFoodList.removeWhere((element) => element.idFood == food.idFood);
    notifyListeners();
  }

  totalAmount() {
    double total = 0;
    for (var food in _cartFoodList) {
      total += (food.price * food.quantity);
    }
    return total;
  }
  //Get all name, quantity, price of food in cart
  getCartFoods() {
    return _cartFoodList;
  }

//  Get all name in cart
  getNameInCartAll() {
    List<String> name = [];
    for (var food in _cartFoodList) {
      name.add(food.foodName);
    }
    return name;
  }
}
