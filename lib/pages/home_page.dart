import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
const APPBAR_SCROLL_OFFSET = 100;
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _imageUrls = [
    'https://mp-piao-admincp.qunarzz.com/mp_piao_admin_mp_piao_admin/admin/20193/34deffd588dac06652b23010e03ef0db.jpg_890x330_37bc88e2.jpg',
    'https://mp-piao-admincp.qunarzz.com/mp_piao_admin_mp_piao_admin/admin/20193/4ac31b476a48d2c5135ed1467ef07fba.jpg_890x330_24d10b4e.jpg',
    'https://mp-piao-admincp.qunarzz.com/mp_piao_admin_mp_piao_admin/admin/20195/b50e30be1cfa1ad77a78bb305c67c52d.jpg_890x330_ac05049c.jpg'
  ];
  double appBarAlpha  = 0;
  _onScroll(offset){
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if(alpha < 0){
      alpha = 0;
    }else if(alpha > 1){
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child:NotificationListener(
                onNotification: (scrollNotification){
                  if(scrollNotification is ScrollUpdateNotification && scrollNotification.depth == 0){
                    _onScroll(scrollNotification.metrics.pixels);
                  }
                },
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 160.0,
                      child:Swiper(
                        itemCount: _imageUrls.length,
                        autoplay: true,
                        itemBuilder:(BuildContext context ,int index){
                          return Image.network(
                            _imageUrls[index],
                            fit: BoxFit.fill,
                          );
                        },
                        pagination: SwiperPagination(),
                      ),
                    ),
                    Container(
                      height: 800,
                      color: Colors.pink,
                      child: ListTile(
                        title:Text('kajsdkjaksjd'),
                      )
                    )
                  ],
                ),
              )

          ),
          Opacity(
            opacity: appBarAlpha,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top:20),
                  child: Text('首页'),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
