
import 'package:flutter/material.dart';
import 'data_movie.dart';
import 'login_page.dart';
//import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final DataMovie dataMovie;

  const DetailPage({Key? key, required this.dataMovie}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0e3754),
        title: Text(dataMovie.title),
      ),
      body: Container(
       padding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 24,
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 24),
              Image.network(
                dataMovie.poster_path,
                width: 150,
              ),
              SizedBox(height: 12),
              Text(
                dataMovie.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                dataMovie.overview,
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 24),
              Text(
                "Language : "'${dataMovie.original_language}',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                "Popularity : "'${dataMovie.popularity}',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "Rating : "'${dataMovie.vote_average}',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "trailer :" '${dataMovie.trailer}',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),            
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed:() {
                      Navigator.pop(context);
                    },
                    child: Text('Kembali'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff0e3754), // background
                      onPrimary: Colors.yellowAccent[700],
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 18,
                      ),
                    ),
                  ),                  
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }),
                        (route) => false,
                      );
                    },
                    child: Text("Logout"),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 18,
                      ),
                    ),
                  ),
                ],
              ),
             
            ],
          ),
        ),
      ),
    );
  }

  //void _launchURL() async {
  //String _url = dataMovie.trailer;
  //if (!await launch(_url)) throw 'Could not launch $_url';
//}
  
}
