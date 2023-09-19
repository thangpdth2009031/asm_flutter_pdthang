import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../core/constant/dimension_constant.dart';
import '../core/hepper/ImageHelper.dart';
import '../core/hepper/TextStyles.dart';
import '../widgets/app_bar_container.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Place {
  final int id;
  final String thumbnail;
  final String name;
  final int? star;

  Place(
      {required this.id,
      required this.thumbnail,
      required this.name,
      required this.star});

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
        id: json['id'],
        thumbnail: json['thumbnail'],
        name: json['name'],
        star: json['star']);
  }
}

class HomePageNew extends StatefulWidget {
  const HomePageNew({super.key});

  @override
  State<HomePageNew> createState() => _HomePageNewState();
}

class _HomePageNewState extends State<HomePageNew> {
  Future<List<Place>> fetchData() async {
    try {
      final String url = 'http://192.168.1.154:8888/api/getAllPlace';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // Giải mã dữ liệu nhận được từ server bằng UTF-8
        final utf8DecodedData = utf8.decode(response.bodyBytes);

        // Chuyển đổi dữ liệu UTF-8 sang JSON
        List<dynamic> jsonResponse = json.decode(utf8DecodedData);
        print(jsonResponse);
        return jsonResponse.map((data) => Place.fromJson(data)).toList();
      } else {
        throw Exception('Unexpected error occurred!');
      }
    } catch (error) {
      throw Exception('Failed to fetch data: $error');
    }
  }

  Widget _buildImageHomeScreen(String name, String image, int star) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => SearchResultPage()))
      },
      child: Container(
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            ImageHelper.loadFromAsset(
              image,
              width: double.maxFinite,
              height: 200,
              fit: BoxFit.cover,
              radius: BorderRadius.circular(kItemPadding),
            ),
            const Padding(
              padding: EdgeInsets.all(kDefaultPadding),
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
            Positioned(
              left: kDefaultPadding,
              bottom: kDefaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyles.defaultStyle.whiteTextColor.bold,
                  ),
                  const SizedBox(
                    height: kItemPadding,
                  ),
                  Container(
                    padding: const EdgeInsets.all(kMinPadding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kMinPadding),
                      color: Colors.white.withOpacity(0.4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star,
                          color: Color(0xffFFC107),
                        ),
                        SizedBox(
                          width: kItemPadding,
                        ),
                        Text(star.toString())
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: AppBarContainer(
            titleString: 'home',
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kItemPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi Guy',
                        style: TextStyles
                            .defaultStyle.fontHeader.whiteTextColor.bold,
                      ),
                      const SizedBox(
                        height: kMediumPadding,
                      ),
                      Text(
                        'Where are you going next ?',
                        style:
                            TextStyles.defaultStyle.fontCaption.whiteTextColor,
                      )
                    ],
                  )
                ],
              ),
            ),
            implementLeading: false,
            child: Column(
              children: [
                TextField(
                  enabled: true,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    hintText: 'Search your destination',
                    // Corrected typo
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(0.8),
                      child: Icon(
                        FontAwesomeIcons.magnifyingGlass,
                        color: Colors.black,
                        size: 14,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          kItemPadding,
                        ),
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: kItemPadding),
                  ),
                  style: TextStyles.defaultStyle,
                  onChanged: (value) {},
                  onSubmitted: (String submitValue) {},
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {

                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFFFDE6D8),
                              shadowColor: Colors.transparent,
                            ),
                            child: Image.asset(
                              "assets/image/ico_hotel.png",
                              width: 70,
                              height: 70,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Hotel",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(width: 16),
                      Column(
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFFF9DEE1),
                              shadowColor: Colors.transparent,
                            ),
                            child: Image.asset(
                              "assets/image/ico_plane.png",
                              width: 70,
                              height: 70,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Flights",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(width: 16),
                      Column(
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(210, 239, 239, 1.0),
                              shadowColor: Colors.transparent,
                            ),
                            child: Image.asset(
                              "assets/image/ico_hotel_plane.png",
                              width: 70,
                              height: 70,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "All",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: kMediumPadding,
                ),
                Row(
                  children: [
                    Text(
                      'Popular Destinations',
                      style: TextStyles.defaultStyle.bold,
                    ),
                  ],
                ),
                const SizedBox(
                  height: kMediumPadding,
                ),
                FutureBuilder<List<Place>>(
                  future: fetchData(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Place>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }

                    List<Place> place = snapshot.data!;

                    return Expanded(
                      child: CustomScrollView(
                        primary: false,
                        slivers: <Widget>[
                          SliverPadding(
                            padding: const EdgeInsets.all(0),
                            sliver: SliverGrid.count(
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              crossAxisCount: 2,
                              children: place
                                  .map(
                                    (e) => _buildImageHomeScreen(
                                      e.name,
                                      e.thumbnail,
                                      e.star ?? 0
                                    ),
                                  )
                                  .toList(),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

