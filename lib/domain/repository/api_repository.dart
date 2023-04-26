// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:context_holder/context_holder.dart';
import 'package:http/http.dart' show Response;

import '../../data/helper/api_helper.dart';
import '../../data/model/character_model.dart';
import '../../data/model/info_model.dart';
import '../../data/model/question_model.dart';
import '../../presentation/screens/no_internet_screen.dart';
import '../../utils/app_method.dart';
import '../utils/api_config.dart';
import '../utils/common_toast.dart';
import '../utils/error_msg.dart';

class ApiRepository {
  Future<bool> checkConnection() async {
    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.ethernet ||
        connectivityResult == ConnectivityResult.vpn) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<InfoModel>> getInfo() async {
    try {
      if (await checkConnection()) {
        final Response response = await ApiHelper.getApi(
          ApiConfig.infoApi,
        );
        if (response.statusCode == 200) {
          final body = jsonDecode(response.body);
          if (body is List && body.isNotEmpty) {
            return body.map((e) => InfoModel.fromJson(e)).toList();
          } else if (body is String) {
            CommonToast.showToast(body);
            return [];
          } else {
            CommonToast.showToast(ErrorMsg.errorWhileGettingInfo);
            return [];
          }
        } else {
          CommonToast.showToast(ErrorMsg.errorWhileGettingInfo);
          return [];
        }
      } else {
        // Navigate to No Internet screen
        AppMethod.pushReplacementRoute(
          ContextHolder.currentContext,
          const NoInternetScreen(),
        );
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
      if (await checkConnection()) {
        final Response response = await ApiHelper.getApi(
          ApiConfig.charactersApi,
        );
        if (response.statusCode == 200) {
          final body = jsonDecode(response.body);
          if (body is List && body.isNotEmpty) {
            return body.map((e) => CharacterModel.fromJson(e)).toList();
          } else if (body is String) {
            CommonToast.showToast(body);
            return [];
          } else {
            CommonToast.showToast(ErrorMsg.errorWhileGettingCharacters);
            return [];
          }
        } else {
          CommonToast.showToast(ErrorMsg.errorWhileGettingCharacters);
          return [];
        }
      } else {
        // Navigate to No Internet screen
        AppMethod.pushReplacementRoute(
          ContextHolder.currentContext,
          const NoInternetScreen(),
        );
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
      if (await checkConnection()) {
        final Response response = await ApiHelper.getApi(
          ApiConfig.questionsApi,
        );
        if (response.statusCode == 200) {
          final body = jsonDecode(response.body);
          if (body is List && body.isNotEmpty) {
            return body.map((e) => QuestionModel.fromJson(e)).toList();
          } else if (body is String) {
            CommonToast.showToast(body);
            return [];
          } else {
            CommonToast.showToast(ErrorMsg.errorWhileGettingQuestions);
            return [];
          }
        } else {
          CommonToast.showToast(ErrorMsg.errorWhileGettingQuestions);
          return [];
        }
      } else {
        // Navigate to No Internet screen
        AppMethod.pushReplacementRoute(
          ContextHolder.currentContext,
          const NoInternetScreen(),
        );
        return [];
      }
    } catch (e) {
      log("=======>   REPO CATCH ERROR  ====   $e");
      CommonToast.showToast(ErrorMsg.errorWhileGettingQuestions);
      return [];
    }
  }
}
