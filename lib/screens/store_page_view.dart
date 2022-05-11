import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoryPageView extends StatelessWidget {
  
  final _storyController = StoryController();
  
  StoryPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = StoryController();
    final List<StoryItem> storyItems =[
      StoryItem.text(title: '''“Do what you can, with what you have, where you are.” – Theodore Roosevelt''', backgroundColor: Colors.red),
      StoryItem.pageImage(url: "https://i.picsum.photos/id/882/200/300.jpg?hmac=j02hkJZfREXyROkSfM6KpIIPHsAaGLmWylVEr5sRzok", controller: _storyController),
      StoryItem.pageImage(url: "https://i.picsum.photos/id/316/200/300.jpg?hmac=sq0VBO6H0wGg9Prod7MVUUB_7B91kmD5E1X1TRSo66U", controller: _storyController, imageFit: BoxFit.contain),

    ];
    return Material(
      child: StoryView(
        storyItems: storyItems,
        controller: controller,
        inline: false,
        repeat: true,
      ),
    );
  }
}

