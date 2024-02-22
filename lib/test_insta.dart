import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InstagramCarouselScreen extends StatefulWidget {
  @override
  _InstagramCarouselScreenState createState() => _InstagramCarouselScreenState();
}

class _InstagramCarouselScreenState extends State<InstagramCarouselScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram Carousel Screen'),
      ),
      body: Center(
        child: InstagramCarousel(username: 'project.dronaid'),
      ),
    );
  }
}

class InstagramCarousel extends StatefulWidget {
  final String username;

  InstagramCarousel({required this.username});

  @override
  _InstagramCarouselState createState() => _InstagramCarouselState();
}

class _InstagramCarouselState extends State<InstagramCarousel> {
  List<String> posts = [];

  @override
  void initState() {
    super.initState();
    fetchInstagramPosts();
  }

  Future<void> fetchInstagramPosts() async {
    final response = await http.get(
      Uri.parse('https://www.instagram.com/${widget.username}/?__a=1'),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final edges = jsonData['graphql']['user']['edge_owner_to_timeline_media']['edges'];

      setState(() {
        posts = List<String>.generate(edges.length, (index) {
          return edges[index]['node']['thumbnail_src'];
        });
      });
    } else {
      // Handle error
      print('Failed to fetch Instagram posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300.0,
        enlargeCenterPage: true,
      ),
      items: posts.map((post) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Image.network(
                post,
                fit: BoxFit.cover,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
