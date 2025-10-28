// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_picking_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ImagePickingState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImagePickingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ImagePickingState()';
}


}

/// @nodoc
class $ImagePickingStateCopyWith<$Res>  {
$ImagePickingStateCopyWith(ImagePickingState _, $Res Function(ImagePickingState) __);
}


/// Adds pattern-matching-related methods to [ImagePickingState].
extension ImagePickingStatePatterns on ImagePickingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ImagePickingStateIdle value)?  idle,TResult Function( ImagePickingStatePicked value)?  imagePicked,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ImagePickingStateIdle() when idle != null:
return idle(_that);case ImagePickingStatePicked() when imagePicked != null:
return imagePicked(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ImagePickingStateIdle value)  idle,required TResult Function( ImagePickingStatePicked value)  imagePicked,}){
final _that = this;
switch (_that) {
case ImagePickingStateIdle():
return idle(_that);case ImagePickingStatePicked():
return imagePicked(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ImagePickingStateIdle value)?  idle,TResult? Function( ImagePickingStatePicked value)?  imagePicked,}){
final _that = this;
switch (_that) {
case ImagePickingStateIdle() when idle != null:
return idle(_that);case ImagePickingStatePicked() when imagePicked != null:
return imagePicked(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function( XFile pickedFile,  ImageLoadingStatus imageStatus)?  imagePicked,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ImagePickingStateIdle() when idle != null:
return idle();case ImagePickingStatePicked() when imagePicked != null:
return imagePicked(_that.pickedFile,_that.imageStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function( XFile pickedFile,  ImageLoadingStatus imageStatus)  imagePicked,}) {final _that = this;
switch (_that) {
case ImagePickingStateIdle():
return idle();case ImagePickingStatePicked():
return imagePicked(_that.pickedFile,_that.imageStatus);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function( XFile pickedFile,  ImageLoadingStatus imageStatus)?  imagePicked,}) {final _that = this;
switch (_that) {
case ImagePickingStateIdle() when idle != null:
return idle();case ImagePickingStatePicked() when imagePicked != null:
return imagePicked(_that.pickedFile,_that.imageStatus);case _:
  return null;

}
}

}

/// @nodoc


class ImagePickingStateIdle implements ImagePickingState {
  const ImagePickingStateIdle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImagePickingStateIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ImagePickingState.idle()';
}


}




/// @nodoc


class ImagePickingStatePicked implements ImagePickingState {
  const ImagePickingStatePicked({required this.pickedFile, this.imageStatus = ImageLoadingStatus.imageLoading});
  

 final  XFile pickedFile;
@JsonKey() final  ImageLoadingStatus imageStatus;

/// Create a copy of ImagePickingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImagePickingStatePickedCopyWith<ImagePickingStatePicked> get copyWith => _$ImagePickingStatePickedCopyWithImpl<ImagePickingStatePicked>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImagePickingStatePicked&&(identical(other.pickedFile, pickedFile) || other.pickedFile == pickedFile)&&(identical(other.imageStatus, imageStatus) || other.imageStatus == imageStatus));
}


@override
int get hashCode => Object.hash(runtimeType,pickedFile,imageStatus);

@override
String toString() {
  return 'ImagePickingState.imagePicked(pickedFile: $pickedFile, imageStatus: $imageStatus)';
}


}

/// @nodoc
abstract mixin class $ImagePickingStatePickedCopyWith<$Res> implements $ImagePickingStateCopyWith<$Res> {
  factory $ImagePickingStatePickedCopyWith(ImagePickingStatePicked value, $Res Function(ImagePickingStatePicked) _then) = _$ImagePickingStatePickedCopyWithImpl;
@useResult
$Res call({
 XFile pickedFile, ImageLoadingStatus imageStatus
});




}
/// @nodoc
class _$ImagePickingStatePickedCopyWithImpl<$Res>
    implements $ImagePickingStatePickedCopyWith<$Res> {
  _$ImagePickingStatePickedCopyWithImpl(this._self, this._then);

  final ImagePickingStatePicked _self;
  final $Res Function(ImagePickingStatePicked) _then;

/// Create a copy of ImagePickingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pickedFile = null,Object? imageStatus = null,}) {
  return _then(ImagePickingStatePicked(
pickedFile: null == pickedFile ? _self.pickedFile : pickedFile // ignore: cast_nullable_to_non_nullable
as XFile,imageStatus: null == imageStatus ? _self.imageStatus : imageStatus // ignore: cast_nullable_to_non_nullable
as ImageLoadingStatus,
  ));
}


}

// dart format on
