library bs_dropdown;

import 'package:ngdart/angular.dart';
import 'package:node_shims/node_shims.dart';
import 'dart:html';
import 'dart:async';

part 'dropdown.dart' ;
part 'menu.dart';
part 'toggle.dart';
//part "keyboard_nav.dart";

const bsDropdownDirectives = [BsDropdownDirective, BsDropdownMenuDirective, BsDropdownToggleDirective];

@Deprecated('Renamed to "bsDropdownDirectives')
const NG_BOOTSTRAP_DROPDOWN_DIRECTIVES = bsDropdownDirectives;
