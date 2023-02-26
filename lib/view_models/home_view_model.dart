import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sinau_studio/utils/error_message.dart';
import 'package:sinau_studio/utils/finite_state.dart';

class HomeViewModel extends ChangeNotifier with FiniteState, ErrorMessage {
  final registerViewModel = ChangeNotifierProvider<HomeViewModel>(
    (ref) => HomeViewModel(),
  );
}
