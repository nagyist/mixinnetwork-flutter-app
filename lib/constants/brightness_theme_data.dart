import 'package:flutter/material.dart';

import '../widgets/brightness_observer.dart';

const lightBrightnessThemeData = BrightnessThemeData(
  primary: Color.fromRGBO(255, 255, 255, 1),
  accent: Color.fromRGBO(61, 117, 227, 1),
  text: Color.fromRGBO(51, 51, 51, 1),
  icon: Color.fromRGBO(47, 48, 50, 1),
  secondaryText: Color.fromRGBO(184, 189, 199, 1),
  sidebarSelected: Color.fromRGBO(0, 0, 0, 0.08),
  listSelected: Color.fromRGBO(246, 247, 250, 1),
  chatBackground: Color.fromRGBO(237, 238, 238, 1),
  background: Color.fromRGBO(246, 247, 250, 1),
  divider: Color.fromRGBO(229, 231, 235, 1),
  popUp: Color.fromRGBO(255, 255, 255, 1),
  red: Color.fromRGBO(229, 120, 116, 1),
  green: Color.fromRGBO(80, 189, 92, 1),
  warning: Color.fromRGBO(244, 171, 45, 1),
  highlight: Color.fromRGBO(167, 242, 89, 1),
  dateTime: Color.fromRGBO(213, 211, 243, 1),
  encrypt: Color.fromRGBO(255, 247, 173, 1),
  statusBackground: Color.fromRGBO(245, 247, 250, 1),
  stickerPlaceholderColor: Color.fromRGBO(236, 236, 236, 1),
  waveformBackground: Color.fromRGBO(221, 221, 221, 1),
  waveformForeground: Color.fromRGBO(155, 155, 155, 1),
  settingCellBackgroundColor: Colors.white,
);

const darkBrightnessThemeData = BrightnessThemeData(
  primary: Color.fromRGBO(44, 49, 54, 1),
  accent: Color.fromRGBO(65, 145, 255, 1),
  text: Color.fromRGBO(255, 255, 255, 0.9),
  icon: Color.fromRGBO(255, 255, 255, 0.9),
  secondaryText: Color.fromRGBO(255, 255, 255, 0.4),
  sidebarSelected: Color.fromRGBO(255, 255, 255, 0.06),
  listSelected: Color.fromRGBO(255, 255, 255, 0.06),
  chatBackground: Color.fromRGBO(35, 39, 43, 1),
  background: Color.fromRGBO(40, 44, 48, 1),
  divider: Color.fromRGBO(0, 0, 0, 0.16),
  popUp: Color.fromRGBO(62, 65, 72, 1),
  red: Color.fromRGBO(246, 112, 112, 1),
  green: Color.fromRGBO(96, 209, 108, 1),
  warning: Color.fromRGBO(243, 177, 64, 1),
  highlight: Color.fromRGBO(134, 184, 82, 1),
  dateTime: Color.fromRGBO(213, 211, 243, 1),
  encrypt: Color.fromRGBO(255, 247, 173, 1),
  statusBackground: Color.fromRGBO(245, 247, 250, 1),
  stickerPlaceholderColor: Color.fromRGBO(40, 44, 48, 1),
  waveformBackground: Color.fromRGBO(255, 255, 255, 0.4),
  waveformForeground: Color.fromRGBO(255, 255, 255, 1),
  settingCellBackgroundColor: Color.fromRGBO(255, 255, 255, 0.06),
);

final circleColors = [
  const Color(0xFF8E7BFF),
  const Color(0xFF657CFB),
  const Color(0xFFA739C2),
  const Color(0xFFBD6DDA),
  const Color(0xFFFD89F1),
  const Color(0xFFFA7B95),
  const Color(0xFFE94156),
  const Color(0xFFFA9652),
  const Color(0xFFF1D22B),
  const Color(0xFFBAE361),
  const Color(0xFF5EDD5E),
  const Color(0xFF4BE6FF),
  const Color(0xFF45B7FE),
  const Color(0xFF00ECD0),
  const Color(0xFFFFCCC0),
  const Color(0xFFCEA06B),
];

final avatarColors = [
  const Color(0xFFFFD659),
  const Color(0xFFFFC168),
  const Color(0xFFF58268),
  const Color(0xFFF4979C),
  const Color(0xFFEC7F87),
  const Color(0xFFFF78CB),
  const Color(0xFFC377E0),
  const Color(0xFF8BAAFF),
  const Color(0xFF78DCFA),
  const Color(0xFF88E5B9),
  const Color(0xFFBFF199),
  const Color(0xFFC5E1A5),
  const Color(0xFFCD907D),
  const Color(0xFFBE938E),
  const Color(0xFFB68F91),
  const Color(0xFFBC987B),
  const Color(0xFFA69E8E),
  const Color(0xFFD4C99E),
  const Color(0xFF93C2E6),
  const Color(0xFF92C3D9),
  const Color(0xFF8FBFC5),
  const Color(0xFF80CBC4),
  const Color(0xFFA4DBDB),
  const Color(0xFFB2C8BD),
  const Color(0xFFF7C8C9),
  const Color(0xFFDCC6E4),
  const Color(0xFFBABAE8),
  const Color(0xFFBABCD5),
  const Color(0xFFAD98DA),
  const Color(0xFFC097D9),
];

final nameColors = [
  const Color(0xFF8C8DFF),
  const Color(0xFF7983C2),
  const Color(0xFF6D8DDE),
  const Color(0xFF5979F0),
  const Color(0xFF6695DF),
  const Color(0xFF8F7AC5),
  const Color(0xFF9D77A5),
  const Color(0xFF8A64D0),
  const Color(0xFFAA66C3),
  const Color(0xFFA75C96),
  const Color(0xFFC8697D),
  const Color(0xFFB74D62),
  const Color(0xFFBD637C),
  const Color(0xFFB3798E),
  const Color(0xFF9B6D77),
  const Color(0xFFB87F7F),
  const Color(0xFFC5595A),
  const Color(0xFFAA4848),
  const Color(0xFFB0665E),
  const Color(0xFFB76753),
  const Color(0xFFBB5334),
  const Color(0xFFC97B46),
  const Color(0xFFBE6C2C),
  const Color(0xFFCB7F40),
  const Color(0xFFA47758),
  const Color(0xFFB69370),
  const Color(0xFFA49373),
  const Color(0xFFAA8A46),
  const Color(0xFFAA8220),
  const Color(0xFF76A048),
  const Color(0xFF9CAD23),
  const Color(0xFFA19431),
  const Color(0xFFAA9100),
  const Color(0xFFA09555),
  const Color(0xFFC49B4B),
  const Color(0xFF5FB05F),
  const Color(0xFF6AB48F),
  const Color(0xFF71B15C),
  const Color(0xFFB3B357),
  const Color(0xFFA3B561),
  const Color(0xFF909F45),
  const Color(0xFF93B289),
  const Color(0xFF3D98D0),
  const Color(0xFF429AB6),
  const Color(0xFF4EABAA),
  const Color(0xFF6BC0CE),
  const Color(0xFF64B5D9),
  const Color(0xFF3E9CCB),
  const Color(0xFF2887C4),
  const Color(0xFF52A98B),
];
