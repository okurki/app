// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inference.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Inference {

 int get id;@JsonKey(name: 'user_id') int get userId; List<Celebrity> get celebrities; double get attractiveness;@IsoDateTimeConverter() DateTime get timestamp;
/// Create a copy of Inference
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InferenceCopyWith<Inference> get copyWith => _$InferenceCopyWithImpl<Inference>(this as Inference, _$identity);

  /// Serializes this Inference to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Inference&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&const DeepCollectionEquality().equals(other.celebrities, celebrities)&&(identical(other.attractiveness, attractiveness) || other.attractiveness == attractiveness)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,const DeepCollectionEquality().hash(celebrities),attractiveness,timestamp);

@override
String toString() {
  return 'Inference(id: $id, userId: $userId, celebrities: $celebrities, attractiveness: $attractiveness, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $InferenceCopyWith<$Res>  {
  factory $InferenceCopyWith(Inference value, $Res Function(Inference) _then) = _$InferenceCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'user_id') int userId, List<Celebrity> celebrities, double attractiveness,@IsoDateTimeConverter() DateTime timestamp
});




}
/// @nodoc
class _$InferenceCopyWithImpl<$Res>
    implements $InferenceCopyWith<$Res> {
  _$InferenceCopyWithImpl(this._self, this._then);

  final Inference _self;
  final $Res Function(Inference) _then;

/// Create a copy of Inference
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? celebrities = null,Object? attractiveness = null,Object? timestamp = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,celebrities: null == celebrities ? _self.celebrities : celebrities // ignore: cast_nullable_to_non_nullable
as List<Celebrity>,attractiveness: null == attractiveness ? _self.attractiveness : attractiveness // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Inference].
extension InferencePatterns on Inference {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Inference value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Inference() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Inference value)  $default,){
final _that = this;
switch (_that) {
case _Inference():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Inference value)?  $default,){
final _that = this;
switch (_that) {
case _Inference() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  int userId,  List<Celebrity> celebrities,  double attractiveness, @IsoDateTimeConverter()  DateTime timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Inference() when $default != null:
return $default(_that.id,_that.userId,_that.celebrities,_that.attractiveness,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  int userId,  List<Celebrity> celebrities,  double attractiveness, @IsoDateTimeConverter()  DateTime timestamp)  $default,) {final _that = this;
switch (_that) {
case _Inference():
return $default(_that.id,_that.userId,_that.celebrities,_that.attractiveness,_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'user_id')  int userId,  List<Celebrity> celebrities,  double attractiveness, @IsoDateTimeConverter()  DateTime timestamp)?  $default,) {final _that = this;
switch (_that) {
case _Inference() when $default != null:
return $default(_that.id,_that.userId,_that.celebrities,_that.attractiveness,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Inference implements Inference {
  const _Inference({required this.id, @JsonKey(name: 'user_id') required this.userId, required final  List<Celebrity> celebrities, required this.attractiveness, @IsoDateTimeConverter() required this.timestamp}): _celebrities = celebrities;
  factory _Inference.fromJson(Map<String, dynamic> json) => _$InferenceFromJson(json);

@override final  int id;
@override@JsonKey(name: 'user_id') final  int userId;
 final  List<Celebrity> _celebrities;
@override List<Celebrity> get celebrities {
  if (_celebrities is EqualUnmodifiableListView) return _celebrities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_celebrities);
}

@override final  double attractiveness;
@override@IsoDateTimeConverter() final  DateTime timestamp;

/// Create a copy of Inference
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InferenceCopyWith<_Inference> get copyWith => __$InferenceCopyWithImpl<_Inference>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InferenceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Inference&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&const DeepCollectionEquality().equals(other._celebrities, _celebrities)&&(identical(other.attractiveness, attractiveness) || other.attractiveness == attractiveness)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,const DeepCollectionEquality().hash(_celebrities),attractiveness,timestamp);

@override
String toString() {
  return 'Inference(id: $id, userId: $userId, celebrities: $celebrities, attractiveness: $attractiveness, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$InferenceCopyWith<$Res> implements $InferenceCopyWith<$Res> {
  factory _$InferenceCopyWith(_Inference value, $Res Function(_Inference) _then) = __$InferenceCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'user_id') int userId, List<Celebrity> celebrities, double attractiveness,@IsoDateTimeConverter() DateTime timestamp
});




}
/// @nodoc
class __$InferenceCopyWithImpl<$Res>
    implements _$InferenceCopyWith<$Res> {
  __$InferenceCopyWithImpl(this._self, this._then);

  final _Inference _self;
  final $Res Function(_Inference) _then;

/// Create a copy of Inference
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? celebrities = null,Object? attractiveness = null,Object? timestamp = null,}) {
  return _then(_Inference(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,celebrities: null == celebrities ? _self._celebrities : celebrities // ignore: cast_nullable_to_non_nullable
as List<Celebrity>,attractiveness: null == attractiveness ? _self.attractiveness : attractiveness // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$Celebrity {

 int get id; String get name;@JsonKey(name: 'img_path') String get imgPath;
/// Create a copy of Celebrity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CelebrityCopyWith<Celebrity> get copyWith => _$CelebrityCopyWithImpl<Celebrity>(this as Celebrity, _$identity);

  /// Serializes this Celebrity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Celebrity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imgPath, imgPath) || other.imgPath == imgPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imgPath);

@override
String toString() {
  return 'Celebrity(id: $id, name: $name, imgPath: $imgPath)';
}


}

/// @nodoc
abstract mixin class $CelebrityCopyWith<$Res>  {
  factory $CelebrityCopyWith(Celebrity value, $Res Function(Celebrity) _then) = _$CelebrityCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'img_path') String imgPath
});




}
/// @nodoc
class _$CelebrityCopyWithImpl<$Res>
    implements $CelebrityCopyWith<$Res> {
  _$CelebrityCopyWithImpl(this._self, this._then);

  final Celebrity _self;
  final $Res Function(Celebrity) _then;

/// Create a copy of Celebrity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? imgPath = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imgPath: null == imgPath ? _self.imgPath : imgPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Celebrity].
extension CelebrityPatterns on Celebrity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Celebrity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Celebrity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Celebrity value)  $default,){
final _that = this;
switch (_that) {
case _Celebrity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Celebrity value)?  $default,){
final _that = this;
switch (_that) {
case _Celebrity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'img_path')  String imgPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Celebrity() when $default != null:
return $default(_that.id,_that.name,_that.imgPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'img_path')  String imgPath)  $default,) {final _that = this;
switch (_that) {
case _Celebrity():
return $default(_that.id,_that.name,_that.imgPath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'img_path')  String imgPath)?  $default,) {final _that = this;
switch (_that) {
case _Celebrity() when $default != null:
return $default(_that.id,_that.name,_that.imgPath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Celebrity implements Celebrity {
  const _Celebrity({required this.id, required this.name, @JsonKey(name: 'img_path') required this.imgPath});
  factory _Celebrity.fromJson(Map<String, dynamic> json) => _$CelebrityFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'img_path') final  String imgPath;

/// Create a copy of Celebrity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CelebrityCopyWith<_Celebrity> get copyWith => __$CelebrityCopyWithImpl<_Celebrity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CelebrityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Celebrity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imgPath, imgPath) || other.imgPath == imgPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imgPath);

@override
String toString() {
  return 'Celebrity(id: $id, name: $name, imgPath: $imgPath)';
}


}

/// @nodoc
abstract mixin class _$CelebrityCopyWith<$Res> implements $CelebrityCopyWith<$Res> {
  factory _$CelebrityCopyWith(_Celebrity value, $Res Function(_Celebrity) _then) = __$CelebrityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'img_path') String imgPath
});




}
/// @nodoc
class __$CelebrityCopyWithImpl<$Res>
    implements _$CelebrityCopyWith<$Res> {
  __$CelebrityCopyWithImpl(this._self, this._then);

  final _Celebrity _self;
  final $Res Function(_Celebrity) _then;

/// Create a copy of Celebrity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? imgPath = null,}) {
  return _then(_Celebrity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imgPath: null == imgPath ? _self.imgPath : imgPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
