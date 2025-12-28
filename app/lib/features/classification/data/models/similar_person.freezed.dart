// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'similar_person.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SimilarPerson {

 Uint8List get imgBytes; int get id; String get name;
/// Create a copy of SimilarPerson
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SimilarPersonCopyWith<SimilarPerson> get copyWith => _$SimilarPersonCopyWithImpl<SimilarPerson>(this as SimilarPerson, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SimilarPerson&&const DeepCollectionEquality().equals(other.imgBytes, imgBytes)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(imgBytes),id,name);

@override
String toString() {
  return 'SimilarPerson(imgBytes: $imgBytes, id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $SimilarPersonCopyWith<$Res>  {
  factory $SimilarPersonCopyWith(SimilarPerson value, $Res Function(SimilarPerson) _then) = _$SimilarPersonCopyWithImpl;
@useResult
$Res call({
 Uint8List imgBytes, int id, String name
});




}
/// @nodoc
class _$SimilarPersonCopyWithImpl<$Res>
    implements $SimilarPersonCopyWith<$Res> {
  _$SimilarPersonCopyWithImpl(this._self, this._then);

  final SimilarPerson _self;
  final $Res Function(SimilarPerson) _then;

/// Create a copy of SimilarPerson
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? imgBytes = null,Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
imgBytes: null == imgBytes ? _self.imgBytes : imgBytes // ignore: cast_nullable_to_non_nullable
as Uint8List,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SimilarPerson].
extension SimilarPersonPatterns on SimilarPerson {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SimilarPerson value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SimilarPerson() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SimilarPerson value)  $default,){
final _that = this;
switch (_that) {
case _SimilarPerson():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SimilarPerson value)?  $default,){
final _that = this;
switch (_that) {
case _SimilarPerson() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Uint8List imgBytes,  int id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SimilarPerson() when $default != null:
return $default(_that.imgBytes,_that.id,_that.name);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Uint8List imgBytes,  int id,  String name)  $default,) {final _that = this;
switch (_that) {
case _SimilarPerson():
return $default(_that.imgBytes,_that.id,_that.name);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Uint8List imgBytes,  int id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _SimilarPerson() when $default != null:
return $default(_that.imgBytes,_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc


class _SimilarPerson implements SimilarPerson {
  const _SimilarPerson({required this.imgBytes, required this.id, required this.name});
  

@override final  Uint8List imgBytes;
@override final  int id;
@override final  String name;

/// Create a copy of SimilarPerson
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SimilarPersonCopyWith<_SimilarPerson> get copyWith => __$SimilarPersonCopyWithImpl<_SimilarPerson>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SimilarPerson&&const DeepCollectionEquality().equals(other.imgBytes, imgBytes)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(imgBytes),id,name);

@override
String toString() {
  return 'SimilarPerson(imgBytes: $imgBytes, id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$SimilarPersonCopyWith<$Res> implements $SimilarPersonCopyWith<$Res> {
  factory _$SimilarPersonCopyWith(_SimilarPerson value, $Res Function(_SimilarPerson) _then) = __$SimilarPersonCopyWithImpl;
@override @useResult
$Res call({
 Uint8List imgBytes, int id, String name
});




}
/// @nodoc
class __$SimilarPersonCopyWithImpl<$Res>
    implements _$SimilarPersonCopyWith<$Res> {
  __$SimilarPersonCopyWithImpl(this._self, this._then);

  final _SimilarPerson _self;
  final $Res Function(_SimilarPerson) _then;

/// Create a copy of SimilarPerson
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? imgBytes = null,Object? id = null,Object? name = null,}) {
  return _then(_SimilarPerson(
imgBytes: null == imgBytes ? _self.imgBytes : imgBytes // ignore: cast_nullable_to_non_nullable
as Uint8List,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
