import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit() : super(BannerInitial());

  final _getit = GetIt.I.get<FirebaseFirestore>();

  int _currentBannerIndex = 0;
  int get getCurrentBannerIndex {
    return _currentBannerIndex;
  }

  set setCurrentBannerIndex(int index) {
    _currentBannerIndex = index;
    emit(CurrentBannerIndexChanged());
  }

  // int? _bannerCount;

  // int? get getBannerCount {
  //   return _bannerCount;
  // }

  // Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getBanner() async {
  //   final response = await _getit.collection('banners').get();
  //   _bannerCount = response.docs.length;
  //   emit(BannerSuccess());
  //   return response.docs;
  // }
}
