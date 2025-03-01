// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  List<ArticleItem> get articles => throw _privateConstructorUsedError;
  String? get query => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  bool get isEveryArticleLoaded => throw _privateConstructorUsedError;
  bool get isFromInput => throw _privateConstructorUsedError;

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewsStateCopyWith<NewsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsStateCopyWith<$Res> {
  factory $NewsStateCopyWith(NewsState value, $Res Function(NewsState) then) =
      _$NewsStateCopyWithImpl<$Res, NewsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isLoadingMore,
      List<ArticleItem> articles,
      String? query,
      String? error,
      bool isEveryArticleLoaded,
      bool isFromInput});
}

/// @nodoc
class _$NewsStateCopyWithImpl<$Res, $Val extends NewsState>
    implements $NewsStateCopyWith<$Res> {
  _$NewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? articles = null,
    Object? query = freezed,
    Object? error = freezed,
    Object? isEveryArticleLoaded = null,
    Object? isFromInput = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      articles: null == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<ArticleItem>,
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isEveryArticleLoaded: null == isEveryArticleLoaded
          ? _value.isEveryArticleLoaded
          : isEveryArticleLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
      isFromInput: null == isFromInput
          ? _value.isFromInput
          : isFromInput // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsStateImplCopyWith<$Res>
    implements $NewsStateCopyWith<$Res> {
  factory _$$NewsStateImplCopyWith(
          _$NewsStateImpl value, $Res Function(_$NewsStateImpl) then) =
      __$$NewsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isLoadingMore,
      List<ArticleItem> articles,
      String? query,
      String? error,
      bool isEveryArticleLoaded,
      bool isFromInput});
}

/// @nodoc
class __$$NewsStateImplCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$NewsStateImpl>
    implements _$$NewsStateImplCopyWith<$Res> {
  __$$NewsStateImplCopyWithImpl(
      _$NewsStateImpl _value, $Res Function(_$NewsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? articles = null,
    Object? query = freezed,
    Object? error = freezed,
    Object? isEveryArticleLoaded = null,
    Object? isFromInput = null,
  }) {
    return _then(_$NewsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      articles: null == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<ArticleItem>,
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isEveryArticleLoaded: null == isEveryArticleLoaded
          ? _value.isEveryArticleLoaded
          : isEveryArticleLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
      isFromInput: null == isFromInput
          ? _value.isFromInput
          : isFromInput // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$NewsStateImpl extends _NewsState {
  const _$NewsStateImpl(
      {this.isLoading = false,
      this.isLoadingMore = false,
      final List<ArticleItem> articles = const [],
      this.query = null,
      this.error = null,
      this.isEveryArticleLoaded = false,
      this.isFromInput = false})
      : _articles = articles,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoadingMore;
  final List<ArticleItem> _articles;
  @override
  @JsonKey()
  List<ArticleItem> get articles {
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  @override
  @JsonKey()
  final String? query;
  @override
  @JsonKey()
  final String? error;
  @override
  @JsonKey()
  final bool isEveryArticleLoaded;
  @override
  @JsonKey()
  final bool isFromInput;

  @override
  String toString() {
    return 'NewsState(isLoading: $isLoading, isLoadingMore: $isLoadingMore, articles: $articles, query: $query, error: $error, isEveryArticleLoaded: $isEveryArticleLoaded, isFromInput: $isFromInput)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            const DeepCollectionEquality().equals(other._articles, _articles) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isEveryArticleLoaded, isEveryArticleLoaded) ||
                other.isEveryArticleLoaded == isEveryArticleLoaded) &&
            (identical(other.isFromInput, isFromInput) ||
                other.isFromInput == isFromInput));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isLoadingMore,
      const DeepCollectionEquality().hash(_articles),
      query,
      error,
      isEveryArticleLoaded,
      isFromInput);

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsStateImplCopyWith<_$NewsStateImpl> get copyWith =>
      __$$NewsStateImplCopyWithImpl<_$NewsStateImpl>(this, _$identity);
}

abstract class _NewsState extends NewsState {
  const factory _NewsState(
      {final bool isLoading,
      final bool isLoadingMore,
      final List<ArticleItem> articles,
      final String? query,
      final String? error,
      final bool isEveryArticleLoaded,
      final bool isFromInput}) = _$NewsStateImpl;
  const _NewsState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isLoadingMore;
  @override
  List<ArticleItem> get articles;
  @override
  String? get query;
  @override
  String? get error;
  @override
  bool get isEveryArticleLoaded;
  @override
  bool get isFromInput;

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewsStateImplCopyWith<_$NewsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
