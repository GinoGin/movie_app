import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:tmdb_api/tmdb_api.dart';
import 'screens/popular.dart';
import 'screens/toprated.dart';
import 'screens/upcomming.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  
  TabController? _tabController;
  List upCommingMovies=[];
  List popularMovies=[];
  List topRatedMovies=[];
  //apikey for TMDB
  final String apiKey="5ed59ac0d01cf8c7ce217d97c48218cb";
  //ReadAccessToken
  final readaccesstoken="eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1ZWQ1OWFjMGQwMWNmOGM3Y2UyMTdkOTdjNDgyMThjYiIsInN1YiI6IjYxYmYyZTZhYTZhNGMxMDA2MTQzZDk4OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.qlNehQgWxeDP3V05CloJa225MfndMkozMYpxZlsYm3M";

  loadmovies()async{
    //creating object for TMDB
    TMDB tmdbwithcustomlogs =TMDB(ApiKeys(apiKey,readaccesstoken),
    logConfig: ConfigLogger(
      showLogs: true,
      showErrorLogs: true,
    ));
    
    Map upcommingResult = await tmdbwithcustomlogs.v3.movies.getUpcoming();
    Map popularResult = await tmdbwithcustomlogs.v3.movies.getPouplar();
    Map topRatedResult = await tmdbwithcustomlogs.v3.movies.getTopRated();

    setState(() {
      upCommingMovies = upcommingResult['results'];
      popularMovies = popularResult['results'];
      topRatedMovies = topRatedResult['results'];
    });

  }

  @override
  void initState() {
    
    super.initState();
    _tabController = TabController(vsync: this, length: 3,initialIndex: 0);
    loadmovies();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movie app",style: TextStyle(fontSize: 24),),
      bottom: TabBar(
        controller: _tabController,
        tabs: [
          Tab(text: "POPULAR",),
          Tab(text: "TOP-RATED",),
          Tab(text: "UPCOMMING",),
          
        ],
      ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          PopularMovie(popular: popularMovies,),
          TopRated(topRated: topRatedMovies,),
          UpCommingMovie(upComming: upCommingMovies,),
          
        ],
      ),
    );
  }
}