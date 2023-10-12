import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User extends ChangeNotifier {
  String email = '';
  String password = '';
  bool? promotion = false;
  String name = '';
  String sex = '';
  int age = 0;
  int height = 0;
  int weight = 0;
  int fatpercent = 0;
  String goal = '';
  List<int?> specifictargets = [];
  String deadline = "";
  int mealprepinterval = 0;
  String nummeals = '';
  String numcheatmeals = '';
  String eatingdisorder = '';
  String healthcondition = '';
  String allergies = '';

  // We change eatingdisorder and healthcondition into List<String> later

  void changeEmail(String newEmail) {
    email = newEmail;
    notifyListeners();
  }

  void changePassword(String newPassword) {
    password = newPassword;
    notifyListeners();
  }

  void changePromotion(bool? promotionStatus) {
    promotion = promotionStatus;
    notifyListeners();
  }

  void changeName(String newName) {
    name = newName;
    notifyListeners();
  }

  void changeAge(int newAge) {
    age = newAge;
    notifyListeners();
  }

  void changeSex(String newSex) {
    sex = newSex;
    notifyListeners();
  }

  void changeHeight(int newHeight) {
    height = newHeight;
    notifyListeners();
  }

  void changeWeight(int newWeight) {
    weight = newWeight;
    notifyListeners();
  }

  void changeFatPercent(int newFatPercent) {
    fatpercent = newFatPercent;
    notifyListeners();
  }

  void changeDeadline(String newDeadline) {
    deadline = newDeadline;
    notifyListeners();
  }

  void changeGoal(String newGoal) {
    goal = newGoal;
    notifyListeners();
  }

  void changeNumMeals(String newNumMeals) {
    nummeals = newNumMeals;
    notifyListeners();
  }

  void changeCheatMeals(String newCheatMeals) {
    numcheatmeals = newCheatMeals;
    notifyListeners();
  }

  void changeDisorder(String newDisorder) {
    eatingdisorder = newDisorder;
    notifyListeners();
  }

  void changeHealthCondition(String newHealth) {
    healthcondition = newHealth;
    notifyListeners();
  }

  void changeAllergies(String newAllergies) {
    healthcondition = newAllergies;
    notifyListeners();
  }

  void registerUser(String emailField, String passwordField) async {
    final _auth = FirebaseAuth.instance;
    await _auth.createUserWithEmailAndPassword(
      email: emailField,
      password: passwordField,
    );
  }

  void loginUser(String emailField, String passwordField) async {
    final _auth = FirebaseAuth.instance;
    await _auth.signInWithEmailAndPassword(
      email: emailField,
      password: passwordField,
    );
  }
}
