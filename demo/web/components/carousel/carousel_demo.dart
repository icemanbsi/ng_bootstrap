import 'package:ngdart/angular.dart';
import 'package:ngforms/angular_forms.dart';
import 'package:ng_bootstrap/components/carousel/carousel.dart';

@Component(selector: 'carousel-demo',
    templateUrl: 'carousel_demo.html',
    directives: [bsCarouselComponents, coreDirectives, formDirectives])
class CarouselDemo {
  num myIntervalInSeconds = 1;
  num get myIntervalInMs => myIntervalInSeconds * 1000;
  bool noWrapSlides = false;
  List slides = [];
  CarouselDemo() {
    for (var i = 0; i < 4; i++) {
      addSlide();
    }
  }

  void addSlide() {
    var newWidth = 600 + slides.length + 1;
    slides.add({
        'image': '''//placekitten.com/${newWidth}/300''',
        'text': '''
${["More" , "Extra" , "Lots of" , "Surplus"][slides.length % 4]}
${["Cats" , "Kittys" , "Felines" , "Cutes"][slides.length % 4]}'''
    });
  }

  void removeSlide(index) {
    slides.removeAt(index);
  }
}
