import 'dart:math' as math;
import 'package:ngdart/angular.dart';
import 'pager.dart';

/// Provide pagination links for your site or app with
/// the multi-page pagination component
@Component(selector: 'bs-pagination',
    templateUrl: 'pagination.html',
    directives: [coreDirectives])
class BsPaginationComponent extends BsPagerComponent implements OnInit {

  BsPaginationComponent() {
    // this line is temporal until `@HostListener` get fixed again
    currentPageChange.listen(onCurrentPageChange);
  }

//  /// css classes
//  @Input('class') String classes = "";

  /// limit number for page links in pager
  @Input() int? maxSize;

  /// if `true` current page will be in the middle of pages list
  @Input() bool rotate = true;

  /// if true shows the direction buttons
  @Input() bool directionLinks = true;

  /// if `false` first and last buttons will be hidden
  @Input() dynamic boundaryLinks = true;

  /// label of first text
  @Input() String firstText = 'First';

  /// label of last text
  @Input() String lastText = 'Last';

  /// label of previous text
  @override
  @Input() String previousText = 'Previous';

  /// label of next text
  @override
  @Input() String nextText = 'Next';

  /// visible pages
  List<Map<String,dynamic>> pages = [];

  @override
  set totalPages(int v) {
    super.totalPages = v;
    onCurrentPageChange(currentPage);
  }

  @override
  void ngOnInit() {
    totalPages = calculateTotalPages();
  }

  /// Create page object used in template
  Map<String,dynamic> makePage(int number, String text, bool isActive) {
    return { 'number' : number, 'text' : text, 'active' : isActive};
  }

  /// get the pages to be viewed in dependence of the [currentPage] and [totalPage]
  List<Map<String,dynamic>> getPages(int currentPage, int totalPages) {
    var pages = <Map<String,dynamic>>[];
    // Default page limits
    var startPage = 1;
    var endPage = totalPages;
    var isMaxSized = maxSize != null && maxSize! < totalPages;
    // recompute if maxSize
    if (isMaxSized) {
      if (rotate) {
        // Current page is displayed in the middle of the visible ones
        startPage = math.max(currentPage - ((maxSize ?? 0) / 2).floor(), 1);
        endPage = startPage + (maxSize ?? 0) - 1;
        // Adjust if limit is exceeded
        if (endPage > totalPages) {
          endPage = totalPages;
          startPage = endPage - (maxSize ?? 0) + 1;
        }
      } else {
        // Visible pages are paginated with maxSize
        startPage = (((currentPage / (maxSize ?? 0)).ceil() - 1) * (maxSize ?? 0)) + 1;
        // Adjust last page if limit is exceeded
        endPage = math.min(startPage + (maxSize ?? 0) - 1, totalPages);
      }
    }
    // Add page number links
    for (var number = startPage; number <= endPage; number ++) {
      var page = makePage(number, number.toString(), number == currentPage);
      pages.add(page);
    }
    // Add links to move between page sets
    if (isMaxSized && !rotate) {
      if (startPage > 1) {
        pages.insert(0, makePage(startPage - 1, '...', false));
      }
      if (endPage < totalPages) {
        pages.add(makePage(endPage + 1, '...', false));
      }
    }
    return pages;
  }

//  @HostListener('currentPageChange', const ['\$event'])
  void onCurrentPageChange(int currentPage) =>
      pages = getPages(currentPage, totalPages);
}
