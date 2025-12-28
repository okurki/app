// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'async_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AsyncValue<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncValue<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsyncValue<$T>()';
}


}

/// @nodoc
class $AsyncValueCopyWith<T,$Res>  {
$AsyncValueCopyWith(AsyncValue<T> _, $Res Function(AsyncValue<T>) __);
}


/// Adds pattern-matching-related methods to [AsyncValue].
extension AsyncValuePatterns<T> on AsyncValue<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AsyncValueIdle<T> value)?  idle,TResult Function( AsyncValueLoading<T> value)?  loading,TResult Function( AsyncValueSuccess<T> value)?  success,TResult Function( AsyncValueError<T> value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AsyncValueIdle() when idle != null:
return idle(_that);case AsyncValueLoading() when loading != null:
return loading(_that);case AsyncValueSuccess() when success != null:
return success(_that);case AsyncValueError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AsyncValueIdle<T> value)  idle,required TResult Function( AsyncValueLoading<T> value)  loading,required TResult Function( AsyncValueSuccess<T> value)  success,required TResult Function( AsyncValueError<T> value)  error,}){
final _that = this;
switch (_that) {
case AsyncValueIdle():
return idle(_that);case AsyncValueLoading():
return loading(_that);case AsyncValueSuccess():
return success(_that);case AsyncValueError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AsyncValueIdle<T> value)?  idle,TResult? Function( AsyncValueLoading<T> value)?  loading,TResult? Function( AsyncValueSuccess<T> value)?  success,TResult? Function( AsyncValueError<T> value)?  error,}){
final _that = this;
switch (_that) {
case AsyncValueIdle() when idle != null:
return idle(_that);case AsyncValueLoading() when loading != null:
return loading(_that);case AsyncValueSuccess() when success != null:
return success(_that);case AsyncValueError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  loading,TResult Function( T value)?  success,TResult Function( Object error,  StackTrace? st)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AsyncValueIdle() when idle != null:
return idle();case AsyncValueLoading() when loading != null:
return loading();case AsyncValueSuccess() when success != null:
return success(_that.value);case AsyncValueError() when error != null:
return error(_that.error,_that.st);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  loading,required TResult Function( T value)  success,required TResult Function( Object error,  StackTrace? st)  error,}) {final _that = this;
switch (_that) {
case AsyncValueIdle():
return idle();case AsyncValueLoading():
return loading();case AsyncValueSuccess():
return success(_that.value);case AsyncValueError():
return error(_that.error,_that.st);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  loading,TResult? Function( T value)?  success,TResult? Function( Object error,  StackTrace? st)?  error,}) {final _that = this;
switch (_that) {
case AsyncValueIdle() when idle != null:
return idle();case AsyncValueLoading() when loading != null:
return loading();case AsyncValueSuccess() when success != null:
return success(_that.value);case AsyncValueError() when error != null:
return error(_that.error,_that.st);case _:
  return null;

}
}

}

/// @nodoc


class AsyncValueIdle<T> implements AsyncValue<T> {
  const AsyncValueIdle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncValueIdle<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsyncValue<$T>.idle()';
}


}




/// @nodoc


class AsyncValueLoading<T> implements AsyncValue<T> {
  const AsyncValueLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncValueLoading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsyncValue<$T>.loading()';
}


}




/// @nodoc


class AsyncValueSuccess<T> implements AsyncValue<T> {
  const AsyncValueSuccess(this.value);
  

 final  T value;

/// Create a copy of AsyncValue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AsyncValueSuccessCopyWith<T, AsyncValueSuccess<T>> get copyWith => _$AsyncValueSuccessCopyWithImpl<T, AsyncValueSuccess<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncValueSuccess<T>&&const DeepCollectionEquality().equals(other.value, value));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'AsyncValue<$T>.success(value: $value)';
}


}

/// @nodoc
abstract mixin class $AsyncValueSuccessCopyWith<T,$Res> implements $AsyncValueCopyWith<T, $Res> {
  factory $AsyncValueSuccessCopyWith(AsyncValueSuccess<T> value, $Res Function(AsyncValueSuccess<T>) _then) = _$AsyncValueSuccessCopyWithImpl;
@useResult
$Res call({
 T value
});




}
/// @nodoc
class _$AsyncValueSuccessCopyWithImpl<T,$Res>
    implements $AsyncValueSuccessCopyWith<T, $Res> {
  _$AsyncValueSuccessCopyWithImpl(this._self, this._then);

  final AsyncValueSuccess<T> _self;
  final $Res Function(AsyncValueSuccess<T>) _then;

/// Create a copy of AsyncValue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = freezed,}) {
  return _then(AsyncValueSuccess<T>(
freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class AsyncValueError<T> implements AsyncValue<T> {
  const AsyncValueError(this.error, [this.st]);
  

 final  Object error;
 final  StackTrace? st;

/// Create a copy of AsyncValue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AsyncValueErrorCopyWith<T, AsyncValueError<T>> get copyWith => _$AsyncValueErrorCopyWithImpl<T, AsyncValueError<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncValueError<T>&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.st, st) || other.st == st));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error),st);

@override
String toString() {
  return 'AsyncValue<$T>.error(error: $error, st: $st)';
}


}

/// @nodoc
abstract mixin class $AsyncValueErrorCopyWith<T,$Res> implements $AsyncValueCopyWith<T, $Res> {
  factory $AsyncValueErrorCopyWith(AsyncValueError<T> value, $Res Function(AsyncValueError<T>) _then) = _$AsyncValueErrorCopyWithImpl;
@useResult
$Res call({
 Object error, StackTrace? st
});




}
/// @nodoc
class _$AsyncValueErrorCopyWithImpl<T,$Res>
    implements $AsyncValueErrorCopyWith<T, $Res> {
  _$AsyncValueErrorCopyWithImpl(this._self, this._then);

  final AsyncValueError<T> _self;
  final $Res Function(AsyncValueError<T>) _then;

/// Create a copy of AsyncValue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? st = freezed,}) {
  return _then(AsyncValueError<T>(
null == error ? _self.error : error ,freezed == st ? _self.st : st // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

// dart format on
