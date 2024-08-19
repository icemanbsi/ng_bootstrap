import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';

/// Creates a progress component
///
/// Base specifications: [bootstrap 4](http://v4-alpha.getbootstrap.com/components/progress/)
///
/// [demo](http://dart-league.github.io/ng_bootstrap/build/web/#progress)
@Component(
    selector: 'bs-progress',
    template: '''
<div class="progress-bar"
     role="progressbar"
     aria-valuenow="0"
     aria-valuemin="0"
     aria-valuemax="100"
     [style.width]="percentage">
  <div [style.width]="elementWidth">
    <template [ngTemplateOutlet]="labelTemplate"
              [ngTemplateOutletContext]="completeLabelTemplateOutput(percentage)"></template>
  </div>
</div>
<template [ngTemplateOutlet]="labelTemplate" [ngTemplateOutletContext]="basicLabelTemplateOutput(percentage)"></template>''',
    directives: [coreDirectives])
class BsProgressComponent implements OnInit, OnDestroy {
  /// if `true` changing `value` of progress bar will be animated (*note*: not supported by Bootstrap 4)
  @Input()
  bool animate = true;

  /// maximum value of the bar
  @Input()
  double max = 100;

  /// value of the progress bar
  @Input()
  double value = 0;

  String get percentage => (value / max * 100).toString() + '%';

  @ContentChild(TemplateRef)
  late TemplateRef labelTemplate;

  /// Handles the width of the element
  String? elementWidth;

  final HtmlElement _elementRef;

  Timer? _resizeTimer;

  BsProgressComponent(this._elementRef);

  /// initialize the attributes
  @override
  void ngOnInit() {
    // animate ??= true;
    // max = max ??= 100;
    Element nativeElement = _elementRef;
    elementWidth = nativeElement.getComputedStyle().width;
    _resizeTimer =
        Timer.periodic(Duration(milliseconds: 500), (_) => elementWidth = nativeElement.getComputedStyle().width);
  }

  @override
  void ngOnDestroy() {
   _resizeTimer?.cancel();
  }

  Map<String, dynamic> basicLabelTemplateOutput(dynamic label) => {r'$implicit': label};

  Map<String, dynamic> completeLabelTemplateOutput(dynamic label) =>
      {r'$implicit': label,
        'value' : value,
        'max': max};
}
