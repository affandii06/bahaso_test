import 'package:bahaso_test/post/post_bloc.dart';
import 'package:bahaso_test/post/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({ Key? key }) : super(key: key);

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {

   ScrollController? _controller = ScrollController();

  int page = 0;

  _updateData()async{
    context.read<PostCubit>().getPost(context, page.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _updateData();
    _controller!.addListener(() {
      if(_controller!.offset == _controller!.position.maxScrollExtent){
        setState(() {
          page += 20;
        });
        _updateData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post'),
        backgroundColor: Colors.blueAccent,
      ),
      body: BlocConsumer<PostCubit, List<PostModel>>(
        listener: (context, post) {
        },
        builder: (context, post) {
          return ListView.builder(
            controller: _controller,
            itemCount: post.isEmpty  ? 0 : post.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  color: Colors.white,
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('No: $index'),
                        const SizedBox(height: 10,),
                        Text('Title: ${post[index].title!}', style: const TextStyle(fontWeight: FontWeight.bold),),
                        const SizedBox(height: 10,),
                        Text('Body: ${post[index].body!}')
                      ],
                    ),
                  ),
                )
              );
            }
          );
        }
      )
    );
  }
}