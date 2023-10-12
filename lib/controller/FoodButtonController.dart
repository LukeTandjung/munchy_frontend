class FoodEaten {
  final String foodName;
  bool isEaten ;
  final String foodQuantity;

  FoodEaten({required this.foodName, this.isEaten = false, required this.foodQuantity});

  void haveChanged() {
    isEaten = !isEaten;
  }
}
