import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'enter_password': 'Enter Password',
      'internet_exceptions': 'we are unable to show results \n please check your internet connections',
      'general_exceptions': 'I am unabled to process your request \n please try again',
    },
    'ur_PK': {
      'enter_password': 'أدخل كلمة المرور'
    },
    'id_ID': {
      'enter_password': 'Masukkan kata sandi'
    }
  };
}