import 'package:flutter/material.dart';

class ToBeWatchScreen extends StatelessWidget {
  // static var routeName;

  const ToBeWatchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          height: size.height -
              AppBar().preferredSize.height -
              MediaQuery.of(context).padding.top,
          width: size.width,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.blueGrey,
                shadowColor: Colors.black87,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.elliptical(100, 200)),
                ),

                floating: false, //ftt
                pinned: true,
                snap: false,

                expandedHeight: 150,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text('To Be Watch Screen'),
                  background: Image.network(
                    'http://images.fandango.com/images/masterrepository/Fandango/186260/theAssassin.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverGrid.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.green[100],
                          child: const Text("movie1"),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.green[100],
                          child: const Text("movie1e"),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.green[100],
                          child: const Text("movie1"),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.green[100],
                          child: const Text("movie1"),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.green[100],
                          child: const Text("movie1"),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.green[100],
                          child: const Text("movie1"),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.green[100],
                          child: const Text("movie1"),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.green[100],
                          child: const Text("movie1"),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.green[100],
                          child: const Text("movie1"),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.green[200],
                          child: const Text('movie1'),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.green[300],
                          child: const Text('movie1'),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.green[400],
                          child: const Text('movie1'),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.green[500],
                          child: const Text('movie1'),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.green[600],
                          child: const Text('movie1'),
                        ),
                      ]))
            ],
          )),
    );
  }
}
