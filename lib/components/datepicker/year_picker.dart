part of bs_date_picker;

/// Creates an [BsYearPickerComponent], this will be the view showed in the [NgBsDatePicker] when user clicks
/// year header button
@Component(selector: 'bs-year-picker',
    templateUrl: 'year_picker.html',
    directives: [coreDirectives],
    providers: [BsDatePickerComponent])
class BsYearPickerComponent {
  /// container of the date-picker
  BsDatePickerComponent? datePicker;

  /// label that appears in the day button which selects the day-picker
  String dayTitle = '';

  /// label that appears in the month button which selects the month-picker
  String monthTitle = '';

  /// rows of the years that will appears in the year-picker
  List<List<DisplayedDate>> rows = <List<DisplayedDate>>[];

  /// gets the value of the starting year of the viewed group
  int getStartingYear(int year) =>
    datePicker == null 
      ? year - 1 
      : ((year - 1) ~/ datePicker!.yearRange) * datePicker!.yearRange + 1;

  void refreshViewHandler() {
    var years = List<DisplayedDate>.filled(datePicker?.yearRange ?? 0, DisplayedDate(DateTime.now(), '', false, false, false));
    DateTime date;
    var initDate = datePicker?._initDate;
    for (var i = 0, start = getStartingYear(initDate?.year ?? DateTime.now().year); i < (datePicker?.yearRange ?? 0); i ++) {
      date = DateTime (start + i, 0, 1);
      years[i] = datePicker?.createDateObject(date, datePicker?.formatYear ?? '') ?? DisplayedDate(DateTime.now(), '', false, false, false);
    }
    dayTitle = datePicker?.dateFilter(initDate ?? DateTime.now(), datePicker?.formatDay ?? '') ?? '';

    monthTitle = datePicker?.dateFilter(initDate ?? DateTime.now(), datePicker?.formatMonth ?? '') ?? '';

    rows = datePicker?.split(years, 5) ?? [];
  }
}
