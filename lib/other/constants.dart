Map<String, String> msg = {
  'Underweight': 'You should eat better to gain weight.',
  'Normal weight': 'Keep up your routine.',
  'Overweight': 'You should exercise.',
  'Obesity Class I': 'You should diet and exercise.',
  'Obesity Class II': 'You should diet and do extreme exercise.',
  'Obesity Class III':
      'Change your life style. Follow strict diet and exercise daily.'
};

class DefaultParamValues {
  static double weight = 55;
  static int age = 18;
  static double height = 150;
}

class Limits {
  static int ageMinLimit = 1;
  static int ageMaxLimit = 150;
  static int weightMinLimit = 1;
  static int weightMaxLimit = 600;
  static double heightMinLimit = 10;
  static double heightMaxLimit = 350;
  static int heightDivisions = 340;
}
