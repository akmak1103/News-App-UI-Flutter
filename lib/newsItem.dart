import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Hero(
              tag: 'trending',
              child: Container(
                height: height * 0.4,
                width: double.infinity,
                decoration: BoxDecoration(
//                          borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withAlpha(95), BlendMode.darken),
                        image: NetworkImage(
                            'https://www.telegraph.co.uk/content/dam/Travel/2018/January/sydney-best-GETTY.jpg?imwidth=650'))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            SizedBox.expand(
              child: DraggableScrollableSheet(
                  maxChildSize: 0.70,
                  minChildSize: 0.70,
                  initialChildSize: 0.70,
                  builder: (BuildContext context, _controller) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.zero,
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.zero),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(35),
                              blurRadius: 5,
                              spreadRadius: 1,
                            )
                          ]),
//                          child: FlutterLogo(),
                      width: width,
                      height: height*0.675,
                      child: Padding(
                        padding: const EdgeInsets.all(17),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Hero(
                              tag:'title',
                              child: SizedBox(
                                width: width * 0.9,
                                child: Text(
                                  'Here is the full title of the news that has been trending recently',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(height: height*0.03,),
                            Hero(
                              tag: 'trending_body',
                              child: SizedBox(
                                width: width * 0.9,
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nFaucibus vitae aliquet nec ullamcorper sit amet risus nullam. Nec ultrices dui sapien eget. Cras adipiscing enim eu turpis egestas pretium aenean pharetra. Sed felis eget velit aliquet sagittis id consectetur. Eget mi proin sed libero enim sed faucibus turpis. Gravida arcu ac tortor dignissim. Nam at lectus urna duis convallis convallis. Vulputate odio ut enim blandit. At imperdiet dui accumsan sit amet nulla facilisi morbi tempus. Nunc pulvinar sapien et ligula ullamcorper malesuada proin libero.',
                                  maxLines: 20,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(11.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  CircleAvatar(backgroundImage: NetworkImage('https://1000logos.net/wp-content/uploads/2016/11/fb-logo.jpg'),),
                                  CircleAvatar(backgroundImage: NetworkImage('https://cdn4.iconfinder.com/data/icons/social-messaging-ui-color-shapes-2-free/128/social-instagram-new-circle-512.png'),),
                                  CircleAvatar(backgroundImage: NetworkImage('https://blog.bitmex.com/wp-content/uploads/2018/10/kisspng-social-media-iphone-organization-logo-twitter-5abe3024502f30.2043853815224136043284.jpg'),),
                                  CircleAvatar(backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/WhatsApp_logo-color-vertical.svg/984px-WhatsApp_logo-color-vertical.svg.png'),),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
