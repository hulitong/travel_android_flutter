import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/category_page.dart';
import '../pages/cart_page.dart';
import '../pages/my_page.dart';




class BottomNavigationBarWidget extends StatefulWidget {
  @override
  _BottomNavigationBarWidgetState createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  final _defaultColors = Colors.grey;
  final _activeColors = Colors.pink;
  int _currentIndex = 0;
  final PageController _controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          CategoryPage(),
          CartPage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex:_currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap:(index){
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home,color: _defaultColors),
                activeIcon:Icon(Icons.home,color: _activeColors ),
                title: Text('首页',style: TextStyle(
                  color: _currentIndex != 0 ?_defaultColors : _activeColors
                ),)
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.category,color: _defaultColors),
                activeIcon:Icon(Icons.category,color: _activeColors ),
                title: Text('分类',style: TextStyle(
                    color: _currentIndex != 1 ?_defaultColors : _activeColors
                ),)
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_shopping_cart,color: _defaultColors),
                activeIcon:Icon(Icons.add_shopping_cart,color: _activeColors ),
                title: Text('购物车',style: TextStyle(
                    color: _currentIndex != 2 ?_defaultColors : _activeColors
                ),)
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.supervisor_account,color: _defaultColors),
                activeIcon:Icon(Icons.supervisor_account,color: _activeColors ),
                title: Text('我',style: TextStyle(
                    color: _currentIndex != 3 ? _defaultColors : _activeColors
                ),)
            )
          ]
      ),
    );
  }
}
