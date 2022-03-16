import 'package:flutter/material.dart';
import 'data_movie.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  final String username;
  var dataListMovie = getDataMovie;

  HomePage({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0e3754),
        title: Text("Home Page"),
      ),
      body: Container(
        child: _listView(),
      ),
    );
  }

  Widget _gridView() {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (_, index) => FlutterLogo(),
      itemCount: 12,
    );
  }

  Widget _listView() {
    return ListView.separated(
      itemBuilder: (context, index) {
        return _createCard(dataListMovie[index], context);
      },
      itemCount: dataListMovie.length,
      separatorBuilder: (BuildContext context, int index) {
        return _separator();
      },
    );
  }

  Widget _createCard(DataMovie dataMovie, BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailPage(dataMovie: dataMovie);
          }));
        },
        child: Container(
          padding: EdgeInsets.all(15),
          child: Row(children: [
            Expanded(
              flex: 1,
              child: Image.network(
                dataMovie.poster_path,
                width: 100,
              ),
            ),
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Text(
                      dataMovie.original_title,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      dataMovie.release_date,
                      style:
                          TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff0e3754), // background
                          onPrimary: Colors.yellowAccent[700], // foreground
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailPage(dataMovie: dataMovie);
                          }));
                        },
                        child: Text("Details")),
                  ],
                )),
          ]),
        ),
      ),
    );
  }

  Widget _separator() {
    return Container(
      color: Colors.blueGrey[100],
      child: Text(
        '',
        style: TextStyle(fontSize: 10),
      ),
    );
  }
}
