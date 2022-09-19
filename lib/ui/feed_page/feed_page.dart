
import 'package:flutter/material.dart';
import 'sections/feed_end_section/feed_end_section.dart';
import 'sections/feed_med_section.dart';
import 'sections/feed_page_top_section.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
       //   top: false,
          child: SingleChildScrollView(
            child: Column(
              children: const [
                FeedPageTopSection(),
                FeedPageMedSection(),
                FeedPageEndSection()
              ],
            ),
          )),
    );
  }
}


