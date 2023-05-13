import 'package:flutter_bloc/flutter_bloc.dart';

part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit() : super(BannerInitial());

  int _currentBannerIndex = 0;
  int get getCurrentBannerIndex {
    return _currentBannerIndex;
  }

  set setCurrentBannerIndex(int index) {
    _currentBannerIndex = index;
    emit(CurrentBannerIndexChanged());
  }
}
