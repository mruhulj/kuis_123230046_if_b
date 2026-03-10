import 'package:flutter/material.dart';

import '../data/newsmodel.dart';

class DetailPage extends StatefulWidget {
  final NewsModel news;

  const DetailPage({super.key, required this.news});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late int currentLikes;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    currentLikes = widget.news.likes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.news.title),
        backgroundColor: const Color.fromARGB(255, 115, 162, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.news.image,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              widget.news.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(widget.news.description),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$currentLikes Likes'),
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: isLiked ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      if (isLiked) {
                        currentLikes--;
                        isLiked = false;
                      } else {
                        currentLikes++;
                        isLiked = true;
                      }
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
