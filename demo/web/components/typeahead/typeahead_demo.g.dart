// GENERATED CODE - DO NOT MODIFY BY HAND

part of typeahead.typeahead_demo;

// **************************************************************************
// SerializableGenerator
// **************************************************************************

abstract class _$StateSerializable {// extends SerializableMap {
  int get id;
  String get name;
  set id(int v);
  set name(String v);
  String toString();

  operator [](Object __key) {
    switch (__key) {
      case 'id':
        return id;
      case 'name':
        return name;
      case 'toString':
        return toString;
    }
    // throwFieldNotFoundException(__key, 'State');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'id':
        id = __value;
        return;
      case 'name':
        name = __value;
        return;
    }
    // throwFieldNotFoundException(__key, 'State');
  }

  Iterable<String>? get keys => null;//StateClassMirror.fields.keys;
}

// **************************************************************************
// MirrorsGenerator
// **************************************************************************

_State__Constructor([positionalParams, namedParams]) => State();

// const $$State_fields_id = DeclarationMirror(
//   name: 'id',
//   type: int,
// );
// const $$State_fields_name = DeclarationMirror(
//   name: 'name',
//   type: String,
// );

// const StateClassMirror = ClassMirror(name: 'State', constructors: {
//   '': FunctionMirror(name: '', $call: _State__Constructor)
// }, fields: {
//   'id': $$State_fields_id,
//   'name': $$State_fields_name
// }, getters: [
//   'id',
//   'name'
// ], setters: [
//   'id',
//   'name'
// ], methods: {
//   'toString': FunctionMirror(
//     name: 'toString',
//     returnType: String,
//   )
// });
