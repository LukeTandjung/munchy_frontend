class UserData {

  String email;
  String password;
  bool promotion;
  String name;
  int age;
  String sex;
  int height;
  int weight;
  int fatpercent;
  String goal;
  List<int?> specifictargets;
  DateTime deadline;
  int mealprepinterval;
  int numcheatmeals;
  bool eatingdisorder;
  List<String> healthcondition;
  List<String> allergies;

  UserData({
    required this.email,
    required this.password,
    required this.promotion,
    required this.name,
    required this.age,
    required this.sex,
    required this.height,
    required this.weight,
    required this.fatpercent,
    required this.goal,
    required this.specifictargets,
    required this.deadline,
    required this.mealprepinterval,
    required this.numcheatmeals,
    required this.eatingdisorder,
    required this.healthcondition,
    required this.allergies ,
  });

  dynamic get() {
    return {
      'Email': email,
      'Password': password,
      'Promotional': promotion == true? "Yes" : "No",
      'Name': name,
      'Age': age,
      'Sex': sex,
      'Height': height,
      'Weight': weight,
      'Body Fat': fatpercent,
      'Goal': goal,
      'Targets': specifictargets,
      'Deadline': deadline,
      'Meal Preparation Interval': mealprepinterval,
      'Number of cheat meals': numcheatmeals,
      'Eating disorder': eatingdisorder,
      'Health Condition': healthcondition,
      'Allergies': allergies
    };
  }
}