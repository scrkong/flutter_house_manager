import 'package:flutter_house_manager/constans/index.dart';
import 'package:flutter_house_manager/pages/Utils/DioRequest.dart';

Future<dynamic> getAnnounceListAPI() => dioRequest.get(HTTP_PATH.ANNOUNCE_LIST);

Future<dynamic> getAnnounceDetailAPI(String id) =>
    dioRequest.get('${HTTP_PATH.ANNOUNCE_LIST}/$id');
