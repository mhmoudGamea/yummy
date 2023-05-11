part of 'banner_cubit.dart';

abstract class BannerState {}

class BannerInitial extends BannerState {}

class BannerLoading extends BannerState {}

class BannerSuccess extends BannerState {
  // final int bannerCount;
  // BannerSuccess({required this.bannerCount});
}

class BannerFailure extends BannerState {}

class CurrentBannerIndexChanged extends BannerState {}
