import 'package:bahaso_test/post/post_model.dart';
import 'package:bahaso_test/post/post_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<List<PostModel>>{
  List<PostModel>? postData;
  PostCubit(List<PostModel> postData) : super(postData);

  void getPost(context, String start)async{
    await PostService.getPost(start).then((value) {
      if(value.length != 0){
        state.addAll(value);
        emit(state);
      }else{
        const snackBar =  SnackBar(
            content: Text('Anda Sudah di Record Terakhir'),
          );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }
}

