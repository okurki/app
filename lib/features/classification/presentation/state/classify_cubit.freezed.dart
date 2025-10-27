// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'classify_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClassifyState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClassifyState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClassifyState()';
}


}

/// @nodoc
class $ClassifyStateCopyWith<$Res>  {
$ClassifyStateCopyWith(ClassifyState _, $Res Function(ClassifyState) __);
}


/// Adds pattern-matching-related methods to [ClassifyState].
extension ClassifyStatePatterns on ClassifyState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ClassifyStateIdle value)?  idle,TResult Function( _ClassifyStateLoading value)?  loading,TResult Function( _ClassifyStateSuccess value)?  success,TResult Function( _ClassifyStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClassifyStateIdle() when idle != null:
return idle(_that);case _ClassifyStateLoading() when loading != null:
return loading(_that);case _ClassifyStateSuccess() when success != null:
return success(_that);case _ClassifyStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ClassifyStateIdle value)  idle,required TResult Function( _ClassifyStateLoading value)  loading,required TResult Function( _ClassifyStateSuccess value)  success,required TResult Function( _ClassifyStateError value)  error,}){
final _that = this;
switch (_that) {
case _ClassifyStateIdle():
return idle(_that);case _ClassifyStateLoading():
return loading(_that);case _ClassifyStateSuccess():
return success(_that);case _ClassifyStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ClassifyStateIdle value)?  idle,TResult? Function( _ClassifyStateLoading value)?  loading,TResult? Function( _ClassifyStateSuccess value)?  success,TResult? Function( _ClassifyStateError value)?  error,}){
final _that = this;
switch (_that) {
case _ClassifyStateIdle() when idle != null:
return idle(_that);case _ClassifyStateLoading() when loading != null:
return loading(_that);case _ClassifyStateSuccess() when success != null:
return success(_that);case _ClassifyStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function( XFile image)?  loading,TResult Function( XFile image,  ClassifyResult value)?  success,TResult Function( Object error,  StackTrace? st)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClassifyStateIdle() when idle != null:
return idle();case _ClassifyStateLoading() when loading != null:
return loading(_that.image);case _ClassifyStateSuccess() when success != null:
return success(_that.image,_that.value);case _ClassifyStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function( XFile image)  loading,required TResult Function( XFile image,  ClassifyResult value)  success,required TResult Function( Object error,  StackTrace? st)  error,}) {final _that = this;
switch (_that) {
case _ClassifyStateIdle():
return idle();case _ClassifyStateLoading():
return loading(_that.image);case _ClassifyStateSuccess():
return success(_that.image,_that.value);case _ClassifyStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function( XFile image)?  loading,TResult? Function( XFile image,  ClassifyResult value)?  success,TResult? Function( Object error,  StackTrace? st)?  error,}) {final _that = this;
switch (_that) {
case _ClassifyStateIdle() when idle != null:
return idle();case _ClassifyStateLoading() when loading != null:
return loading(_that.image);case _ClassifyStateSuccess() when success != null:
return success(_that.image,_that.value);case _ClassifyStateError() when error != null:
return error(_that.error,_that.st);case _:
  return null;

}
}

}

/// @nodoc


class _ClassifyStateIdle implements ClassifyState {
  const _ClassifyStateIdle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClassifyStateIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClassifyState.idle()';
}


}




/// @nodoc


class _ClassifyStateLoading implements ClassifyState {
  const _ClassifyStateLoading({required this.image});
  

 final  XFile image;

/// Create a copy of ClassifyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClassifyStateLoadingCopyWith<_ClassifyStateLoading> get copyWith => __$ClassifyStateLoadingCopyWithImpl<_ClassifyStateLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClassifyStateLoading&&(identical(other.image, image) || other.image == image));
}


@override
int get hashCode => Object.hash(runtimeType,image);

@override
String toString() {
  return 'ClassifyState.loading(image: $image)';
}


}

/// @nodoc
abstract mixin class _$ClassifyStateLoadingCopyWith<$Res> implements $ClassifyStateCopyWith<$Res> {
  factory _$ClassifyStateLoadingCopyWith(_ClassifyStateLoading value, $Res Function(_ClassifyStateLoading) _then) = __$ClassifyStateLoadingCopyWithImpl;
@useResult
$Res call({
 XFile image
});




}
/// @nodoc
class __$ClassifyStateLoadingCopyWithImpl<$Res>
    implements _$ClassifyStateLoadingCopyWith<$Res> {
  __$ClassifyStateLoadingCopyWithImpl(this._self, this._then);

  final _ClassifyStateLoading _self;
  final $Res Function(_ClassifyStateLoading) _then;

/// Create a copy of ClassifyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? image = null,}) {
  return _then(_ClassifyStateLoading(
image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as XFile,
  ));
}


}

/// @nodoc


class _ClassifyStateSuccess implements ClassifyState {
  const _ClassifyStateSuccess({required this.image, required this.value});
  

 final  XFile image;
 final  ClassifyResult value;

/// Create a copy of ClassifyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClassifyStateSuccessCopyWith<_ClassifyStateSuccess> get copyWith => __$ClassifyStateSuccessCopyWithImpl<_ClassifyStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClassifyStateSuccess&&(identical(other.image, image) || other.image == image)&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,image,value);

@override
String toString() {
  return 'ClassifyState.success(image: $image, value: $value)';
}


}

/// @nodoc
abstract mixin class _$ClassifyStateSuccessCopyWith<$Res> implements $ClassifyStateCopyWith<$Res> {
  factory _$ClassifyStateSuccessCopyWith(_ClassifyStateSuccess value, $Res Function(_ClassifyStateSuccess) _then) = __$ClassifyStateSuccessCopyWithImpl;
@useResult
$Res call({
 XFile image, ClassifyResult value
});


$ClassifyResultCopyWith<$Res> get value;

}
/// @nodoc
class __$ClassifyStateSuccessCopyWithImpl<$Res>
    implements _$ClassifyStateSuccessCopyWith<$Res> {
  __$ClassifyStateSuccessCopyWithImpl(this._self, this._then);

  final _ClassifyStateSuccess _self;
  final $Res Function(_ClassifyStateSuccess) _then;

/// Create a copy of ClassifyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? image = null,Object? value = null,}) {
  return _then(_ClassifyStateSuccess(
image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as XFile,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as ClassifyResult,
  ));
}

/// Create a copy of ClassifyState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClassifyResultCopyWith<$Res> get value {
  
  return $ClassifyResultCopyWith<$Res>(_self.value, (value) {
    return _then(_self.copyWith(value: value));
  });
}
}

/// @nodoc


class _ClassifyStateError implements ClassifyState {
  const _ClassifyStateError(this.error, [this.st]);
  

 final  Object error;
 final  StackTrace? st;

/// Create a copy of ClassifyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClassifyStateErrorCopyWith<_ClassifyStateError> get copyWith => __$ClassifyStateErrorCopyWithImpl<_ClassifyStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClassifyStateError&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.st, st) || other.st == st));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error),st);

@override
String toString() {
  return 'ClassifyState.error(error: $error, st: $st)';
}


}

/// @nodoc
abstract mixin class _$ClassifyStateErrorCopyWith<$Res> implements $ClassifyStateCopyWith<$Res> {
  factory _$ClassifyStateErrorCopyWith(_ClassifyStateError value, $Res Function(_ClassifyStateError) _then) = __$ClassifyStateErrorCopyWithImpl;
@useResult
$Res call({
 Object error, StackTrace? st
});




}
/// @nodoc
class __$ClassifyStateErrorCopyWithImpl<$Res>
    implements _$ClassifyStateErrorCopyWith<$Res> {
  __$ClassifyStateErrorCopyWithImpl(this._self, this._then);

  final _ClassifyStateError _self;
  final $Res Function(_ClassifyStateError) _then;

/// Create a copy of ClassifyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? st = freezed,}) {
  return _then(_ClassifyStateError(
null == error ? _self.error : error ,freezed == st ? _self.st : st // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

// dart format on
