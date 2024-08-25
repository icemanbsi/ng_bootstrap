import 'package:ngdart/angular.dart';
import 'package:ngforms/angular_forms.dart';
import 'package:ng_bootstrap/components/accordion/accordion.dart';

@Component(selector: 'accordion-demo',
    templateUrl: 'accordion_demo.html',
    directives: [bsAccordionDirectives, coreDirectives, formDirectives])
class AccordionDemo {
  bool oneAtATime = true;

  List<String> items = ['Item 1', 'Item 2', 'Item 3'];

  Map status = {'isFirstOpen': true, 'isFirstDisabled': false, 'isLastOpen': false};

  List<dynamic> groups = [
    {'title': 'Dynamic Group Header - 1', 'content': 'Dynamic Group Body - 1'},
    {'title': 'Dynamic Group Header - 2', 'content': 'Dynamic Group Body - 2'}
  ];

  void addItem() {
    items.add('Item ${items.length + 1}');
  }
}
