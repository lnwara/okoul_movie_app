import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/paginationController.dart';
import '../../../helpers/constants.dart';
import '../../components/common/paginatedList.dart';


class Trends extends StatelessWidget {
  const Trends({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MovieList(title: 'Trending Movies', controller: Get.find<PaginationController>(tag: MovieSection.trending.toString() ,));
  }
}