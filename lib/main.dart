import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Sample2(),
    );
  }
}


class Sample2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
child: CustomScrollView(
  slivers: [
    SliverPersistentHeader(
      delegate: MySliverAppBar(expadedHeight: 200),
      pinned: true,
    ),
    SliverList(
      delegate: SliverChildBuilderDelegate(
          (_, index) => ListTile(
            title: Text("Index: $index"),
          )
      ),
    )
  ],
),
      ),
    );
  }
}


class MySliverAppBar extends SliverPersistentHeaderDelegate {

  final double expadedHeight;

  MySliverAppBar({@required this.expadedHeight});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        
        Image.network('https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        fit: BoxFit.cover),

        Center(
          child: Opacity(
            opacity: shrinkOffset / expadedHeight,
            child: Text(
              "MySliverAppBar",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 23
              ),
            ),
          ),
        ),

        Positioned(
          top: expadedHeight / 2 - shrinkOffset,
          left: MediaQuery.of(context).size.width / 4,
          child: Opacity(
            opacity: (1 - shrinkOffset / expadedHeight),
            child: Card(
              elevation: 10,
              child: SizedBox(
                height: expadedHeight,
                width: MediaQuery.of(context).size.width / 2,
                child: FlutterLogo(),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => expadedHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}


/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Sample1()
    );
  }
}

class Sample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyCustomAppBar(height: 150),
        body: Center(
          child: FlutterLogo(
            size: MediaQuery.of(context).size.width/2,
          ),
        ),
      ),
    );
  }
}


class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  
  final double height;

  MyCustomAppBar({Key key, @required this.height}) : super (key : key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey[300],
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Container(
              color: Colors.red,
              padding: EdgeInsets.all(5),
              child: Row(
                children: [

                 CustomIconButton(),

                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          contentPadding: EdgeInsets.all(10),
                        ),
                      ),
                    ),
                  ),

                  IconButton(
                    icon: Icon(Icons.verified_user),
                    onPressed: ()=> null,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }



  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

class CustomIconButton extends StatefulWidget {
  @override
  _CustomIconButtonState createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) {
    return  IconButton(
      icon: Icon(Icons.menu),
      onPressed: (){
        print('Open Drawer');
        Scaffold.of(context).openEndDrawer();
      },
    );
  }
} */


/*


class Sample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(),
        appBar: MyCustomAppBar(
          height: 150,
        ),
body: Center(
  child:   FlutterLogo(
  size: MediaQuery.of(context).size.width/2,
  ),
),
      ),
    );
  }
}

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const MyCustomAppBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: AppBar(
              title: Container(
                color: Colors.white,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),

              actions: [
                IconButton(
                  icon: Icon(Icons.verified_user),
                  onPressed: ()=>null,
                )
              ],

            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

*/