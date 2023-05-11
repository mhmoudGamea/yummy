part of 'banner_cubit.dart';

@immutable
abstract class BannerState {}

class BannerInitial extends BannerState {}

class BannerLoading extends BannerState {}

class BannerSuccess extends BannerState {
  final List<String> banners;

  BannerSuccess({required this.banners});
}

class BannerFailure extends BannerState {
  final String error;
  BannerFailure({required this.error});
}
