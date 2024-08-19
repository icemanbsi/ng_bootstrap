part of bs_table_directives;

/// Directive to create columns for [BsTableComponent]
@Directive(selector: 'bs-column')
class BsColumnDirective {
  /// Handles the sort of the column. It could have next values:
  ///
  /// * 'ASC': for ascending sorting
  /// * 'DESC': for descending sorting
  /// * 'NONE': for non-sorting
  /// * 'NO_SORTABLE': for column not sortable
  @Input() String sort = 'NONE';

  /// Name of the field associated with the column
  @Input() String fieldName = '';

  /// Value displayed in the column header
  @Input() String header = '';

  /// name of field or function used to sort this column
  @Input() var/*String | Function*/ orderBy;

  /// style of the column
  ///
  ///     <bs-column style="width: 120px; flex: none"></bs-column>
  @Input() String? style;

  /// class of the column
  ///
  ///     <bs-column ngClass="bg-red"></bs-column>
  @Input() var ngClass;

  @ContentChild(TemplateRef)
  TemplateRef? templateRef;

  @ContentChild(BsColumnEditorDirective)
  BsColumnEditorDirective? editor;

  dynamic /* String | Map<String, dynamic> */ filterValue;

  @ContentChild(BsColumnFiltererDirective)
  BsColumnFiltererDirective? filterer;
}
