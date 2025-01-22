import 'package:flutter_bloc/flutter_bloc.dart';

import 'paypal_state.dart';

class PaypalCubit extends Cubit<PaypalState> {
  PaypalCubit() : super(PaypalInitial());
}
