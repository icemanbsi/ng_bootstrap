import 'dart:html';

import 'package:ngdart/angular.dart';
import 'package:ng_bootstrap/ng_bootstrap.dart';
import 'package:string_converters/string_converters.dart';

@Component(
    selector: 'demo-section',
    templateUrl: 'demo_section.html',
    directives: [bsDirectives])
class DemoSection implements OnInit {
  @Input() String name = '';

  @Input() String? docPath;

  late String nameTN, docUrl, dart, html;

  ViewContainerRef viewRef;

  DemoSection(@Inject(ViewContainerRef) this.viewRef);

  @override
  void ngOnInit() async {
    nameTN = toTableName(name);
    var docPathNameTN = 'components_$nameTN\_$nameTN';
    var rawMasterUrl = 'https://raw.githubusercontent.com/dart-league/ng_bootstrap/master/demo';
    var componentsUrl = '$rawMasterUrl/web/components';
    var _docPath = docPath ?? docPathNameTN;
    docUrl = 'https://www.dartdocs.org/documentation/ng_bootstrap/latest/$_docPath/$_docPath-library.html';
    dart = await HttpRequest.getString('$componentsUrl/$nameTN/${nameTN}_demo.dart');
    html = await HttpRequest.getString('$componentsUrl/$nameTN/${nameTN}_demo.html');
  }
}
