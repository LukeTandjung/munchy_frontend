
class OnboardQuestions {

  DateTime deadline;
  int numdayinterval;

  OnboardQuestions({this.numdayinterval = 0, required this.deadline});

  static final Map<String, Map<String, String>> questions = {
    "Q1": {
      "Question": "What is your goal?",
      "Description": "Munchy accommodates a wide variety of goals!",
      "Bottom text": ""
    },
    "Q2": {
      "Question": "Do you have any specific targets?",
      "Description": "While each target is optional, this helps Munchy plan your diet with greater accuracy",
      "Bottom text": ""
    },
    "Q3": {
      "Question": "Do you have a goal deadline?",
      "Description": "Munchy can plan diets subject to urgent time crunches!",
      "Bottom text": "Munchy does not advocate for crash dieting. If you are not an athlete, or not involved in combat sports,"
          " we highly recommend you choose the latter option."
    },
    "Q4": {
      "Question": "How many meals do you eat a day?",
      "Description": "This helps Munchy recommend recipes for you",
      "Bottom text": "Sure! Just a note: if you eat less than two meals a day, Munchy will choose to recommend two meals a day,"
          " as it is not built to recommend only one meal a day."
    },
    "Q5": {
      "Question": "How do you prepare meals?",
      "Description": "This ensures diets planned remain fresh and convenient!",
      "Bottom text": ""
    },
    "Q6": {
      "Question": "How many cheat meals do you want?",
      "Description": "Munchy diets are always sustainable in the long term!",
      "Bottom text": "Only choose this option if you feel you can carry out such a diet in the long term!"
    },
    "Q8": {
      "Question": "Do you have an active diagnosis of an eating disorder?",
      "Description": "",
      "Bottom text": "Thank you for letting us know! Unfortunately, Munchy is not currently designed to support those with an active "
          "eating disorder. We recommend seeking the advice of trained medical professionals for advice on your condition."
    },
    "Q9": {
      "Question": "Do you have any of these health conditions?",
      "Description": "",
      "Bottom text": "Don't worry if you have any of these conditions! Munchy will just automatically make adjustments to your diet "
          "based on your condition."
    },
    "Q10": {
      "Question": "Do you have any of these allergies?",
      "Description": "",
      "Bottom text": "Again, don't worry if you have any of these allergies! Munchy will just automatically make adjustments to your diet "
          "based on your condition."
    },
  };

  static Map<String, Map<String, bool>> questionOptions = {
    "Q1": {
      "Lose fat": false,
      "Gain muscle": false,
      "Lose fat and gain muscle": false,
      "Gain muscle and fat": false,
      "Maintain weight and health": false
    },
    // "Q2": {
    //   "Weight": 0,
    //   "Muscle mass": 0,
    //   "Fat percentage": 0
    // },
    "Q4": {
      "Two or less": false,
      "Three": false,
      "More than three": false
    },
    "Q6": {
      "No cheat meals": false,
      "One cheat meal": false,
      "Two cheat meals": false,
      "Three cheat meals": false
    },
    "Q8": {
      "Yes": false,
      "No": false
    },
    "Q9": {
      "Heart Disease or Stroke": false,
      "Diabetes": false,
      "Gout": false,
      "High Cholesterol": false
    },
    "Q10": {
      "Shellfish": false,
      "Nuts or Tree Nuts": false,
      "Milk": false,
      "Eggs": false
    }
  };

  static Map<String, dynamic> variableOptions = {
    "Q3": {
      "Yes, I need to achieve my goal by": false,
      "No, I do not have one": false,
      "date": DateTime.utc(1900, 1, 1),
    },
    "Q5": {
      "I prepare the same meals for": false,
      "I don't do meal preparation, I cook something different every day": false,
      "day intervals": 0,
    },
  };

  static Map<String, String> mapFromQuestionName(String questionName) {
    return questions[questionName]!;
  }

  static Map<String, bool> mapFromQuestionOption(String questionOption) {
    return questionOptions[questionOption]!;
  }

  static Map<String, dynamic> mapFromVariableOption(String variableOption) {
    return variableOptions[variableOption]!;
  }


}