import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/apiutils/api_response.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/movie/movie_respo.dart';
import 'package:flutterbeginner/provider/movie_provider.dart';
import 'package:provider/provider.dart';

class PullToRefresh extends StatefulWidget {
  @override
  State<PullToRefresh> createState() => _PullToRefreshState();
}

class _PullToRefreshState extends State<PullToRefresh> {
  late MovieProvider movieData;

  @override
  void initState() {
    super.initState();
    movieData = MovieProvider();
    movieData.fetchMovieList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(ctx:context,title: StringConst.SWIPE_TO_REFRESH_TITLE),
      body: ChangeNotifierProvider<MovieProvider>(
        create: (BuildContext context) => movieData,
        child: MovieDataScreen(),
      ),
    );
  }
}

class MovieDataScreen extends StatelessWidget {
  late MovieProvider appState;

  @override
  Widget build(BuildContext context) {
    //    appState.providerCall();
    return RefreshIndicator(
        onRefresh: () => appState.fetchMovieList(),
        child: apiResponse(context));
  }

  Widget apiResponse(BuildContext context) {
    appState = Provider.of<MovieProvider>(context);
    var jsonResult = appState.getMovieRespo;
    switch (jsonResult?.status) {
      case ApiStatus.loading:
        printLog(msg: "LOADING");
        return Loading();
      case ApiStatus.success:
        printLog(msg: "COMPLETED");
        return MovieList(movieList: jsonResult!.data!.results!);
      case ApiStatus.error:
        printLog(msg: "ERROR");
        return Error(
          errorMessage: jsonResult!.apiError!.errorMessage!,
          onRetryPressed: () => appState.fetchMovieList(),
        );
      default:
        {
          return Container(
            color: Colors.amber,
          );
        }
    }
  }
}

class MovieList extends StatelessWidget {
  final List<Movie> movieList;

  const MovieList({super.key, required this.movieList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movieList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5 / 1.8,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.network(
                'https://image.tmdb.org/t/p/w342${movieList[index].posterPath}',
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      },
    );
  }
}

class Error extends StatelessWidget {
  final String errorMessage;

  final Function onRetryPressed;

  const Error({Key? key, required this.errorMessage, required this.onRetryPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.lightGreen,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          MaterialButton(
            color: Colors.lightGreen,
            onPressed: onRetryPressed(),
            child: const Text('Retry', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "loadingMessage",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.lightGreen,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 24),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.lightGreen),
          ),
        ],
      ),
    );
  }
}
