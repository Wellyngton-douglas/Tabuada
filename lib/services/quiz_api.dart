import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz/models/question.dart';

class QuizApi {
  static Future<List<Question>> fetch() async {
    try {
      var url =
          'https://script.googleusercontent.com/macros/echo?user_content_key=IxSBDREnesG3zur-Rm7Eh268VHaZMqyx2aNIqyg3axaf77NOZkCjz64rsfynOnxSvYfEeW6mZ5nEtypoNOWT9vpv54uqzg2tm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnPMBS4J2uHbyGgRIivizijs7HW0Qo21b2QIKs4IayZ8JSR7rm3xRvVitJqSVCxaB7lj1_RnZsEeoY7u9ovcMVym8cv7vWJ9jUQ&lib=M2z86qGB84A0aHdyJ6Eez775piq28bWUU';
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return List<Question>.from(
            data["questions"].map((x) => Question.fromMap(x)));
      } else {
        return List<Question>();
      }
    } catch (error) {
      print(error);
      return List<Question>();
    }
  }
}
