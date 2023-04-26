import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' show Response;

import '../../data/helper/api_helper.dart';
import '../../data/model/character_model.dart';
import '../../data/model/info_model.dart';
import '../../data/model/question_model.dart';
import '../utils/api_config.dart';
import '../utils/common_toast.dart';
import '../utils/error_msg.dart';

class ApiRepository {
  Future<List<InfoModel>> getInfo() async {
    try {
      final Response response = await ApiHelper.getApi(
        ApiConfig.infoApi,
      );
      if (response.statusCode == 200) {
        final List body = jsonDecode(response.body);
        if (body.isNotEmpty) {
          return body.map((e) => InfoModel.fromJson(e)).toList();
        } else {
          CommonToast.showToast(ErrorMsg.errorWhileGettingInfo);
          return [];
        }
      } else {
        CommonToast.showToast(ErrorMsg.errorWhileGettingInfo);
        return [];
      }
    } catch (e) {
      log("=======>   REPO CATCH ERROR  ====   $e");
      CommonToast.showToast(ErrorMsg.errorWhileGettingInfo);
      return [];
    }
  }

  Future<List<CharacterModel>> getCharacters() async {
    try {
      final Response response = await ApiHelper.getApi(
        ApiConfig.charactersApi,
      );
      if (response.statusCode == 200) {
        final List body = jsonDecode(response.body);
        if (body.isNotEmpty) {
          return body.map((e) => CharacterModel.fromJson(e)).toList();
        } else {
          CommonToast.showToast(ErrorMsg.errorWhileGettingCharacters);
          return [];
        }
      } else {
        CommonToast.showToast(ErrorMsg.errorWhileGettingCharacters);
        return [];
      }
    } catch (e) {
      log("=======>   REPO CATCH ERROR  ====   $e");
      CommonToast.showToast(ErrorMsg.errorWhileGettingCharacters);
      return [];
    }
  }

  Future<List<QuestionModel>> getQuestions() async {
    try {
      final Response response = await ApiHelper.getApi(
        ApiConfig.questionsApi,
      );
      if (response.statusCode == 200) {
        final List body = jsonDecode(response.body);
        if (body.isNotEmpty) {
          return body.map((e) => QuestionModel.fromJson(e)).toList();
        } else {
          CommonToast.showToast(ErrorMsg.errorWhileGettingQuestions);
          return [];
        }
      } else {
        CommonToast.showToast(ErrorMsg.errorWhileGettingQuestions);
        return [];
      }
    } catch (e) {
      log("=======>   REPO CATCH ERROR  ====   $e");
      CommonToast.showToast(ErrorMsg.errorWhileGettingQuestions);
      return [];
    }
  }
}
