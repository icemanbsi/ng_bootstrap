import 'package:angular/angular.dart';
import 'package:ng_bootstrap/ng_bootstrap.dart';
import 'package:string_converters/string_converters.dart' as dsc;

@Component(
    selector: 'demo-header',
    templateUrl: 'demo_header.html',
    directives: [bsDirectives, coreDirectives])
class DemoHeader {
  List<String> components = [
    'Accordion',
    'Alert',
    'Buttons',
    'Carousel',
    'Collapse',
    'Datepicker',
    'Dropdown',
    'File Upload',
    'Input',
    'Modal',
    'Pagination',
    'Popover',
    'Progress',
    'Prompt',
    'Rating',
    'Table',
    'Tabs',
    'Tabsx',
    'Timepicker',
    'Tooltip',
    'Typeahead'
  ];

  late String prefix;

  bool isCollapsed = true;

  Function toTableName = dsc.toTableName;

  DemoHeader() {
    prefix =  '';
  }
}
