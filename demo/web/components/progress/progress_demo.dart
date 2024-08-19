import 'dart:math';

import 'package:angular/angular.dart';
import 'package:ng_bootstrap/ng_bootstrap.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(selector: 'progress-demo',
    templateUrl: 'progress_demo.html',
    directives: [BsProgressComponent, BsToggleButtonDirective, coreDirectives, formDirectives])
class ProgressDemo {
  int max = 200;

  bool showWarning = false;

  int value = 0;

  String type = '';

  List stacked = [];

  bool showResizeable = true;

  ProgressDemo() {
    random();
  }

  void random() {
    value = Random().nextInt(100);
    if (value < 25) {
      type = 'success';
    } else if (value < 50) {
      type = 'info';
    } else if (value < 75) {
      type = 'warning';
    } else {
      type = 'danger';
    }
    showWarning = type == 'danger' || type == 'warning';
  }
}
