import 'package:mobx/mobx.dart';
import 'package:meta/meta.dart';

import 'package:sw_planets_app/app/home/home_service.dart';

import 'models/result_model.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  _HomeStore({@required this.service});

  final HomeService service;

  @observable
  ResultModel data;

  @action
  Future<void> getData({String nextUrl}) async =>
      data = await service.getPlanets(nextUrl: nextUrl);

  @action
  Future<void> getDataByQuery(
    String query, {
    String nextUrl,
  }) async =>
      data = await service.getPlanetsByQuery(
        query,
        nextUrl: nextUrl,
      );
}