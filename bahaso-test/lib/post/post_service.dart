import 'package:bahaso_test/env.dart';
import 'package:bahaso_test/post/post_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostService {

  static Future getPost(String start)async{
    var response = await http.get(Uri.parse('${Env.url}posts?_start=$start&_limit=20'));

    return PostModel().postFromJson(response.body);
  }

}