import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okoul_movie_app/controllers/genresPaginationController.dart';

import '../common/movieItem.dart';

class ScrolableList extends StatefulWidget {
  const ScrolableList({Key? key}) : super(key: key);

  @override
  State<ScrolableList> createState() => _ScrolableList();
}


class _ScrolableList extends State<ScrolableList> {
  final ScrollController sController = ScrollController();
  final GenresPaginationController gController=Get.find();

  @override
  void dispose() {
    sController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    gController.scrollController=sController;
    sController.addListener(gController.loadPaginationMoviesByCatogry);
     return  Obx(()=>
        ListView.separated
                  (
                    controller: sController,
                    itemBuilder: (context, index) {
                      if(index==gController.movies[gController.currentgGenre]!.length-1)
                      {
                        return const MovieItemSkelton();
                      }
                      return MovieItem(movie:gController.movies[gController.currentgGenre]![index]);
                    },
                    separatorBuilder: (context, index) =>const Divider(),
                    itemCount: gController.movies[gController.currentgGenre]!.length),
     );
    
    // ListView
    //   (
     
    //     scrollDirection: Axis.vertical,
    //     controller: sController,
    //     children: gController.movies[gController.currentgGenre]!.map((m) => MovieItem( movie: m,)
    
    //     ).toList() 
    //   );
  }
}