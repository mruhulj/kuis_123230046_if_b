import 'package:flutter/material.dart';
import 'package:kuis_123230046_if_b/pages/profile_page.dart';
// import 'package:kuis_123230046_if_b/pages/login_page.dart';

import '../data/newsmodel.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  final String username;
  final List<NewsModel> newsList;

  const HomePage({super.key, required this.username, required this.newsList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('News App - $username'),
        backgroundColor: const Color.fromARGB(255, 115, 162, 255),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(username: username),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.red),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            final newsItem = newsList[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                    child: Image.network(
                      newsItem.image,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      newsItem.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.favorite, color: Colors.red, size: 16),
                        const SizedBox(width: 5),
                        Text(
                          '${newsItem.likes} Likes',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(news: newsItem),
                        ),
                      );
                    },
                    child: const Text('Lihat Detail'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
