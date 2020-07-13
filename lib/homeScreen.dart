import 'dart:math';

import 'newsItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 5, vsync: this, initialIndex: 0);
    super.initState();
  }

  List<String> headlineImages = [
    'http://graphics8.nytimes.com/images/2012/07/13/blogs/seattle-drone/seattle-drone--articleInline.jpg',
    'http://media2.popsugar-assets.com/files/thumbor/8IXZIlMq8E8BFcR6nr1Dy6m4y1M/fit-in/1024x1024/filters:format_auto-!!-:strip_icc-!!-/2016/07/13/866/n/1922564/7fd0c0e73673b7d4_GettyImages-142382064.jpg',
    'https://www.igovtt.tt/wp-content/uploads/2018/06/intelligentserviceshomepage.jpg',
    'https://www.crazypundit.com/wp-content/uploads/2014/01/Megyn-Kelly-fox-news-anchor.jpg',
    'http://thewowstyle.com/wp-content/uploads/2015/04/big_wildlife_and_animal_volunteer.jpg'
  ];

  List<Color> articleColors = [
    Color(0xff1D15F4),
    Color(0xffCC832A),
    Color(0xffDD5A04),
    Color(0xff0059B8)
  ];
  List<String> authorPhoto = [
    'https://pcolman.files.wordpress.com/2016/05/author-pic.jpg',
    'https://lastfm.freetls.fastly.net/i/u/avatar300s/7f7ed3595ee6419bc1ac7104f778b256.jpg',
    'http://www.windycitymediagroup.com/images/publications/wct/2007-04-11/Imus-color.jpg',
    'https://pbs.twimg.com/profile_images/378800000727683402/ab8126bb4781023726e86506e2cdd38f_400x400.jpeg'
  ];

  List<String> newsItem = [
    'https://sa.kapamilya.com/absnews/abscbnnews/media/2020/news/01/27/20200123-naia-coronavirus-watch-md-6964.jpg?ext=.jpg',
    'https://www.timesnews.net/image/2018/02/08/x720_q60/Multiple-sports-SPORTS-logo-jpg-1.jpg',
    'https://www.telegraph.co.uk/content/dam/business/spark/sme-home/hp/hp_borrowing-xlarge.jpg',
    'https://cdn.images.express.co.uk/img/dynamic/78/590x/ww3-latest-news-Iran-Soleimani-funeral-1225113.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text('News', style: TextStyle(color: Colors.black87)),
          leading: Icon(
            Icons.menu,
            color: Colors.black87,
          ),
          centerTitle: true,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(
                Icons.search,
                color: Colors.black87,
              ),
            )
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'World',
              ),
              Tab(
                text: 'Business',
              ),
              Tab(
                text: 'Politics',
              ),
              Tab(
                text: 'Tech',
              ),
              Tab(
                text: 'Science',
              )
            ],
            controller: _tabController,
            indicator: UnderlineTabIndicator(borderSide: BorderSide.none),
            indicatorColor: Colors.white,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black38,
            labelPadding: EdgeInsets.all(0),
          ),
        ),
        body: CustomScrollView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            slivers: [
              SliverToBoxAdapter(
                key: ObjectKey('headlines'),
                child: Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: SizedBox(
                    height: height * 0.32,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: headlineImages.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Container(
                            width: width * 0.4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    fit: BoxFit.fitHeight,
                                    colorFilter: ColorFilter.mode(
                                        Colors.black.withAlpha(50),
                                        BlendMode.darken),
                                    image:
                                        NetworkImage(headlineImages[index]))),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    'This is headline #' +
                                        (index + 1).toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Text(
                                    new Random().nextInt(5).toString() +
                                        ' hours ago',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: height * 0.028,
                ),
              ),
              SliverToBoxAdapter(
                key: ObjectKey('articles'),
                child: Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: SizedBox(
                    height: height * 0.12,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: authorPhoto.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Container(
                              width: width * 0.6,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: articleColors[index]),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(authorPhoto[index]),
                                      radius: 25,
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                          'Author Name',
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 12),
                                        ),
                                        Text(
                                          'Article title #' +
                                              (index + 1).toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
//                                  SizedBox(height: height * 0.01,),
                                        Text(
                                          new Random().nextInt(30).toString() +
                                              ' June, 2019',
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                key: ObjectKey('trending'),
                child: GestureDetector(
                  onTap: () {
                    return Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => NewsItem()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      width: double.infinity,
                      height: height * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Hero(
                            tag: 'trending',
                            child: Container(
                              width: width * 0.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      fit: BoxFit.fitHeight,
                                      image: NetworkImage(
                                          'https://www.telegraph.co.uk/content/dam/Travel/2018/January/sydney-best-GETTY.jpg?imwidth=650'))),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.03,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                'Trending Story',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                              Hero(
                                tag: 'title',
                                child: SizedBox(
                                  width: width * 0.45,
                                  child: Text(
                                    'Some Trending News Title Is Here',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Hero(
                                tag: 'trending_body',
                                child: SizedBox(
                                  width: width * 0.45,
                                  child: Text(
                                    'This is a very important news that people are engaging with right now.',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.black38,
                                    size: 15,
                                  ),
                                  Text(
                                    ' 2946 people are reading',
                                    style: TextStyle(
                                        color: Colors.black38, fontSize: 12),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverFixedExtentList(
                itemExtent: height * 0.22,
                delegate: SliverChildBuilderDelegate((context, idx) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withAlpha(30),
                                spreadRadius: 1,
                                blurRadius: 5)
                          ]),
                      padding: EdgeInsets.all(4),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: width * 0.28,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    fit: BoxFit.fitHeight,
                                    image: NetworkImage(
                                        newsItem[new Random().nextInt(3)]))),
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              SizedBox(
                                width: width * 0.55,
                                child: Text(
                                  'This is a long news title that can expand to 2 lines and then it shows ellipsis.',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              SizedBox(
                                width: width * 0.55,
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Text(
                                '22nd June, 2020',
                                style: TextStyle(color: Colors.black54),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
//                  return Divider(height: 1,);
                }),
              ),
            ]),
      ),
    );
  }
}
