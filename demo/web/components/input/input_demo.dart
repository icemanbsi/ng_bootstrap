import 'package:ngdart/angular.dart';
import 'package:ngforms/angular_forms.dart';
import 'package:ng_bootstrap/components/input/input.dart';

@Component(selector: 'input-demo',
    templateUrl: 'input_demo.html',
    directives: [BsInput, coreDirectives, formDirectives])
class InputDemo {
  Person person = Person()
      ..firstName = 'Jhon asdf'
      ..lastName = 'Doe asdf';

  String pattern1 = '[a-zA-z]*';

  String otherName = 'Jane Smith';
}

class Person {
  late String firstName;
  late String lastName;
}
