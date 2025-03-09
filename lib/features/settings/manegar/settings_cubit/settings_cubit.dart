import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/settings/manegar/settings_cubit/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  static SettingsCubit get(context) => BlocProvider.of(context);
  bool light = false;
  bool sign = false;
  void OnChange_Switch(value) {
    value = light;
    emit(OnChangeSwitch());
  }

  void OnChange_Checkbox(value) {
    value = sign;
    emit(OnChangeCheckbox());
  }
}