// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fts_database.dart';

// ignore_for_file: type=lint
class MessagesFts extends Table
    with
        TableInfo<MessagesFts, MessagesFt>,
        VirtualTableInfo<MessagesFts, MessagesFt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  MessagesFts(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [content];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'messages_fts';
  @override
  VerificationContext validateIntegrity(
    Insertable<MessagesFt> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  MessagesFt map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MessagesFt(
      content:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}content'],
          )!,
    );
  }

  @override
  MessagesFts createAlias(String alias) {
    return MessagesFts(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
  @override
  String get moduleAndArgs =>
      'FTS5(content, tokenize="unicode61 remove_diacritics 2 categories \'Co L* N* S*\'")';
}

class MessagesFt extends DataClass implements Insertable<MessagesFt> {
  final String content;
  const MessagesFt({required this.content});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['content'] = Variable<String>(content);
    return map;
  }

  MessagesFtsCompanion toCompanion(bool nullToAbsent) {
    return MessagesFtsCompanion(content: Value(content));
  }

  factory MessagesFt.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MessagesFt(content: serializer.fromJson<String>(json['content']));
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'content': serializer.toJson<String>(content)};
  }

  MessagesFt copyWith({String? content}) =>
      MessagesFt(content: content ?? this.content);
  MessagesFt copyWithCompanion(MessagesFtsCompanion data) {
    return MessagesFt(
      content: data.content.present ? data.content.value : this.content,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MessagesFt(')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => content.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MessagesFt && other.content == this.content);
}

class MessagesFtsCompanion extends UpdateCompanion<MessagesFt> {
  final Value<String> content;
  final Value<int> rowid;
  const MessagesFtsCompanion({
    this.content = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MessagesFtsCompanion.insert({
    required String content,
    this.rowid = const Value.absent(),
  }) : content = Value(content);
  static Insertable<MessagesFt> custom({
    Expression<String>? content,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (content != null) 'content': content,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MessagesFtsCompanion copyWith({Value<String>? content, Value<int>? rowid}) {
    return MessagesFtsCompanion(
      content: content ?? this.content,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MessagesFtsCompanion(')
          ..write('content: $content, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class MessagesMetas extends Table with TableInfo<MessagesMetas, MessagesMeta> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  MessagesMetas(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _docIdMeta = const VerificationMeta('docId');
  late final GeneratedColumn<int> docId = GeneratedColumn<int>(
    'doc_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _messageIdMeta = const VerificationMeta(
    'messageId',
  );
  late final GeneratedColumn<String> messageId = GeneratedColumn<String>(
    'message_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _conversationIdMeta = const VerificationMeta(
    'conversationId',
  );
  late final GeneratedColumn<String> conversationId = GeneratedColumn<String>(
    'conversation_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumnWithTypeConverter<DateTime, int> createdAt =
      GeneratedColumn<int>(
        'created_at',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      ).withConverter<DateTime>(MessagesMetas.$convertercreatedAt);
  @override
  List<GeneratedColumn> get $columns => [
    docId,
    messageId,
    conversationId,
    category,
    userId,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'messages_metas';
  @override
  VerificationContext validateIntegrity(
    Insertable<MessagesMeta> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('doc_id')) {
      context.handle(
        _docIdMeta,
        docId.isAcceptableOrUnknown(data['doc_id']!, _docIdMeta),
      );
    } else if (isInserting) {
      context.missing(_docIdMeta);
    }
    if (data.containsKey('message_id')) {
      context.handle(
        _messageIdMeta,
        messageId.isAcceptableOrUnknown(data['message_id']!, _messageIdMeta),
      );
    } else if (isInserting) {
      context.missing(_messageIdMeta);
    }
    if (data.containsKey('conversation_id')) {
      context.handle(
        _conversationIdMeta,
        conversationId.isAcceptableOrUnknown(
          data['conversation_id']!,
          _conversationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_conversationIdMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {messageId};
  @override
  MessagesMeta map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MessagesMeta(
      docId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}doc_id'],
          )!,
      messageId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}message_id'],
          )!,
      conversationId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}conversation_id'],
          )!,
      category:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}category'],
          )!,
      userId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}user_id'],
          )!,
      createdAt: MessagesMetas.$convertercreatedAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}created_at'],
        )!,
      ),
    );
  }

  @override
  MessagesMetas createAlias(String alias) {
    return MessagesMetas(attachedDatabase, alias);
  }

  static TypeConverter<DateTime, int> $convertercreatedAt =
      const MillisDateConverter();
  @override
  List<String> get customConstraints => const ['PRIMARY KEY(message_id)'];
  @override
  bool get dontWriteConstraints => true;
}

class MessagesMeta extends DataClass implements Insertable<MessagesMeta> {
  final int docId;
  final String messageId;
  final String conversationId;
  final String category;
  final String userId;
  final DateTime createdAt;
  const MessagesMeta({
    required this.docId,
    required this.messageId,
    required this.conversationId,
    required this.category,
    required this.userId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['doc_id'] = Variable<int>(docId);
    map['message_id'] = Variable<String>(messageId);
    map['conversation_id'] = Variable<String>(conversationId);
    map['category'] = Variable<String>(category);
    map['user_id'] = Variable<String>(userId);
    {
      map['created_at'] = Variable<int>(
        MessagesMetas.$convertercreatedAt.toSql(createdAt),
      );
    }
    return map;
  }

  MessagesMetasCompanion toCompanion(bool nullToAbsent) {
    return MessagesMetasCompanion(
      docId: Value(docId),
      messageId: Value(messageId),
      conversationId: Value(conversationId),
      category: Value(category),
      userId: Value(userId),
      createdAt: Value(createdAt),
    );
  }

  factory MessagesMeta.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MessagesMeta(
      docId: serializer.fromJson<int>(json['doc_id']),
      messageId: serializer.fromJson<String>(json['message_id']),
      conversationId: serializer.fromJson<String>(json['conversation_id']),
      category: serializer.fromJson<String>(json['category']),
      userId: serializer.fromJson<String>(json['user_id']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'doc_id': serializer.toJson<int>(docId),
      'message_id': serializer.toJson<String>(messageId),
      'conversation_id': serializer.toJson<String>(conversationId),
      'category': serializer.toJson<String>(category),
      'user_id': serializer.toJson<String>(userId),
      'created_at': serializer.toJson<DateTime>(createdAt),
    };
  }

  MessagesMeta copyWith({
    int? docId,
    String? messageId,
    String? conversationId,
    String? category,
    String? userId,
    DateTime? createdAt,
  }) => MessagesMeta(
    docId: docId ?? this.docId,
    messageId: messageId ?? this.messageId,
    conversationId: conversationId ?? this.conversationId,
    category: category ?? this.category,
    userId: userId ?? this.userId,
    createdAt: createdAt ?? this.createdAt,
  );
  MessagesMeta copyWithCompanion(MessagesMetasCompanion data) {
    return MessagesMeta(
      docId: data.docId.present ? data.docId.value : this.docId,
      messageId: data.messageId.present ? data.messageId.value : this.messageId,
      conversationId:
          data.conversationId.present
              ? data.conversationId.value
              : this.conversationId,
      category: data.category.present ? data.category.value : this.category,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MessagesMeta(')
          ..write('docId: $docId, ')
          ..write('messageId: $messageId, ')
          ..write('conversationId: $conversationId, ')
          ..write('category: $category, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    docId,
    messageId,
    conversationId,
    category,
    userId,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MessagesMeta &&
          other.docId == this.docId &&
          other.messageId == this.messageId &&
          other.conversationId == this.conversationId &&
          other.category == this.category &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt);
}

class MessagesMetasCompanion extends UpdateCompanion<MessagesMeta> {
  final Value<int> docId;
  final Value<String> messageId;
  final Value<String> conversationId;
  final Value<String> category;
  final Value<String> userId;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const MessagesMetasCompanion({
    this.docId = const Value.absent(),
    this.messageId = const Value.absent(),
    this.conversationId = const Value.absent(),
    this.category = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MessagesMetasCompanion.insert({
    required int docId,
    required String messageId,
    required String conversationId,
    required String category,
    required String userId,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : docId = Value(docId),
       messageId = Value(messageId),
       conversationId = Value(conversationId),
       category = Value(category),
       userId = Value(userId),
       createdAt = Value(createdAt);
  static Insertable<MessagesMeta> custom({
    Expression<int>? docId,
    Expression<String>? messageId,
    Expression<String>? conversationId,
    Expression<String>? category,
    Expression<String>? userId,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (docId != null) 'doc_id': docId,
      if (messageId != null) 'message_id': messageId,
      if (conversationId != null) 'conversation_id': conversationId,
      if (category != null) 'category': category,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MessagesMetasCompanion copyWith({
    Value<int>? docId,
    Value<String>? messageId,
    Value<String>? conversationId,
    Value<String>? category,
    Value<String>? userId,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return MessagesMetasCompanion(
      docId: docId ?? this.docId,
      messageId: messageId ?? this.messageId,
      conversationId: conversationId ?? this.conversationId,
      category: category ?? this.category,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (docId.present) {
      map['doc_id'] = Variable<int>(docId.value);
    }
    if (messageId.present) {
      map['message_id'] = Variable<String>(messageId.value);
    }
    if (conversationId.present) {
      map['conversation_id'] = Variable<String>(conversationId.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(
        MessagesMetas.$convertercreatedAt.toSql(createdAt.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MessagesMetasCompanion(')
          ..write('docId: $docId, ')
          ..write('messageId: $messageId, ')
          ..write('conversationId: $conversationId, ')
          ..write('category: $category, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$FtsDatabase extends GeneratedDatabase {
  _$FtsDatabase(QueryExecutor e) : super(e);
  $FtsDatabaseManager get managers => $FtsDatabaseManager(this);
  late final MessagesFts messagesFts = MessagesFts(this);
  late final MessagesMetas messagesMetas = MessagesMetas(this);
  late final Index messagesMetasDocIdCreatedAt = Index(
    'messages_metas_doc_id_created_at',
    'CREATE INDEX IF NOT EXISTS messages_metas_doc_id_created_at ON messages_metas (doc_id, created_at)',
  );
  late final Index messagesMetasConversationIdUserIdCategory = Index(
    'messages_metas_conversation_id_user_id_category',
    'CREATE INDEX IF NOT EXISTS messages_metas_conversation_id_user_id_category ON messages_metas (conversation_id, user_id, category)',
  );
  Future<int> _deleteFtsByMessageId(String messageId) {
    return customUpdate(
      'DELETE FROM messages_fts WHERE "rowid" = (SELECT doc_id FROM messages_metas WHERE message_id = ?1)',
      variables: [Variable<String>(messageId)],
      updates: {messagesFts},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> _deleteFtsByConversationId(String conversationId) {
    return customUpdate(
      'DELETE FROM messages_fts WHERE "rowid" = (SELECT doc_id FROM messages_metas WHERE conversation_id = ?1)',
      variables: [Variable<String>(conversationId)],
      updates: {messagesFts},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<String> _fuzzySearchAllMessage(
    String query,
    FuzzySearchAllMessage$where where,
    int limit,
  ) {
    var $arrayStartIndex = 3;
    final generatedwhere = $write(
      where(alias(this.messagesMetas, 'm')),
      startIndex: $arrayStartIndex,
    );
    $arrayStartIndex += generatedwhere.amountOfVariables;
    return customSelect(
      'SELECT m.message_id FROM messages_metas AS m,(SELECT "rowid" FROM messages_fts WHERE messages_fts MATCH ?1) AS fts WHERE m.doc_id = fts."rowid" AND ${generatedwhere.sql} ORDER BY m.created_at DESC, m."rowid" DESC LIMIT ?2',
      variables: [
        Variable<String>(query),
        Variable<int>(limit),
        ...generatedwhere.introducedVariables,
      ],
      readsFrom: {messagesMetas, messagesFts, ...generatedwhere.watchedTables},
    ).map((QueryRow row) => row.read<String>('message_id'));
  }

  Selectable<String> _fuzzySearchAllMessageWithAnchor(
    String query,
    String anchorMessageId,
    FuzzySearchAllMessageWithAnchor$where where,
    int limit,
  ) {
    var $arrayStartIndex = 4;
    final generatedwhere = $write(
      where(alias(this.messagesMetas, 'm')),
      startIndex: $arrayStartIndex,
    );
    $arrayStartIndex += generatedwhere.amountOfVariables;
    return customSelect(
      'SELECT m.message_id FROM messages_metas AS m,(SELECT "rowid" FROM messages_fts WHERE messages_fts MATCH ?1) AS fts,(SELECT created_at, "rowid" FROM messages_metas WHERE message_id = ?2) AS anchor WHERE m.doc_id = fts."rowid" AND(m.created_at < anchor.created_at OR(m.created_at = anchor.created_at AND m."rowid" < anchor."rowid"))AND ${generatedwhere.sql} ORDER BY m.created_at DESC, m."rowid" DESC LIMIT ?3',
      variables: [
        Variable<String>(query),
        Variable<String>(anchorMessageId),
        Variable<int>(limit),
        ...generatedwhere.introducedVariables,
      ],
      readsFrom: {messagesMetas, messagesFts, ...generatedwhere.watchedTables},
    ).map((QueryRow row) => row.read<String>('message_id'));
  }

  Selectable<String> getAllMatchedMessageIds(String query) {
    return customSelect(
      'SELECT message_id FROM messages_metas WHERE doc_id IN (SELECT "rowid" FROM messages_fts WHERE messages_fts MATCH ?1) ORDER BY created_at DESC, "rowid" DESC',
      variables: [Variable<String>(query)],
      readsFrom: {messagesMetas, messagesFts},
    ).map((QueryRow row) => row.read<String>('message_id'));
  }

  Selectable<bool> checkMessageMetaExists(String messageId) {
    return customSelect(
      'SELECT EXISTS (SELECT 1 AS _c1 FROM messages_metas WHERE message_id = ?1) AS _c0',
      variables: [Variable<String>(messageId)],
      readsFrom: {messagesMetas},
    ).map((QueryRow row) => row.read<bool>('_c0'));
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    messagesFts,
    messagesMetas,
    messagesMetasDocIdCreatedAt,
    messagesMetasConversationIdUserIdCategory,
  ];
}

typedef $MessagesFtsCreateCompanionBuilder =
    MessagesFtsCompanion Function({required String content, Value<int> rowid});
typedef $MessagesFtsUpdateCompanionBuilder =
    MessagesFtsCompanion Function({Value<String> content, Value<int> rowid});

class $MessagesFtsFilterComposer extends Composer<_$FtsDatabase, MessagesFts> {
  $MessagesFtsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );
}

class $MessagesFtsOrderingComposer
    extends Composer<_$FtsDatabase, MessagesFts> {
  $MessagesFtsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );
}

class $MessagesFtsAnnotationComposer
    extends Composer<_$FtsDatabase, MessagesFts> {
  $MessagesFtsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);
}

class $MessagesFtsTableManager
    extends
        RootTableManager<
          _$FtsDatabase,
          MessagesFts,
          MessagesFt,
          $MessagesFtsFilterComposer,
          $MessagesFtsOrderingComposer,
          $MessagesFtsAnnotationComposer,
          $MessagesFtsCreateCompanionBuilder,
          $MessagesFtsUpdateCompanionBuilder,
          (MessagesFt, BaseReferences<_$FtsDatabase, MessagesFts, MessagesFt>),
          MessagesFt,
          PrefetchHooks Function()
        > {
  $MessagesFtsTableManager(_$FtsDatabase db, MessagesFts table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $MessagesFtsFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $MessagesFtsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $MessagesFtsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> content = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MessagesFtsCompanion(content: content, rowid: rowid),
          createCompanionCallback:
              ({
                required String content,
                Value<int> rowid = const Value.absent(),
              }) => MessagesFtsCompanion.insert(content: content, rowid: rowid),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $MessagesFtsProcessedTableManager =
    ProcessedTableManager<
      _$FtsDatabase,
      MessagesFts,
      MessagesFt,
      $MessagesFtsFilterComposer,
      $MessagesFtsOrderingComposer,
      $MessagesFtsAnnotationComposer,
      $MessagesFtsCreateCompanionBuilder,
      $MessagesFtsUpdateCompanionBuilder,
      (MessagesFt, BaseReferences<_$FtsDatabase, MessagesFts, MessagesFt>),
      MessagesFt,
      PrefetchHooks Function()
    >;
typedef $MessagesMetasCreateCompanionBuilder =
    MessagesMetasCompanion Function({
      required int docId,
      required String messageId,
      required String conversationId,
      required String category,
      required String userId,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $MessagesMetasUpdateCompanionBuilder =
    MessagesMetasCompanion Function({
      Value<int> docId,
      Value<String> messageId,
      Value<String> conversationId,
      Value<String> category,
      Value<String> userId,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $MessagesMetasFilterComposer
    extends Composer<_$FtsDatabase, MessagesMetas> {
  $MessagesMetasFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get docId => $composableBuilder(
    column: $table.docId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get messageId => $composableBuilder(
    column: $table.messageId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get conversationId => $composableBuilder(
    column: $table.conversationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime, DateTime, int> get createdAt =>
      $composableBuilder(
        column: $table.createdAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );
}

class $MessagesMetasOrderingComposer
    extends Composer<_$FtsDatabase, MessagesMetas> {
  $MessagesMetasOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get docId => $composableBuilder(
    column: $table.docId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get messageId => $composableBuilder(
    column: $table.messageId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get conversationId => $composableBuilder(
    column: $table.conversationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $MessagesMetasAnnotationComposer
    extends Composer<_$FtsDatabase, MessagesMetas> {
  $MessagesMetasAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get docId =>
      $composableBuilder(column: $table.docId, builder: (column) => column);

  GeneratedColumn<String> get messageId =>
      $composableBuilder(column: $table.messageId, builder: (column) => column);

  GeneratedColumn<String> get conversationId => $composableBuilder(
    column: $table.conversationId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime, int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $MessagesMetasTableManager
    extends
        RootTableManager<
          _$FtsDatabase,
          MessagesMetas,
          MessagesMeta,
          $MessagesMetasFilterComposer,
          $MessagesMetasOrderingComposer,
          $MessagesMetasAnnotationComposer,
          $MessagesMetasCreateCompanionBuilder,
          $MessagesMetasUpdateCompanionBuilder,
          (
            MessagesMeta,
            BaseReferences<_$FtsDatabase, MessagesMetas, MessagesMeta>,
          ),
          MessagesMeta,
          PrefetchHooks Function()
        > {
  $MessagesMetasTableManager(_$FtsDatabase db, MessagesMetas table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $MessagesMetasFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $MessagesMetasOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $MessagesMetasAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> docId = const Value.absent(),
                Value<String> messageId = const Value.absent(),
                Value<String> conversationId = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MessagesMetasCompanion(
                docId: docId,
                messageId: messageId,
                conversationId: conversationId,
                category: category,
                userId: userId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int docId,
                required String messageId,
                required String conversationId,
                required String category,
                required String userId,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => MessagesMetasCompanion.insert(
                docId: docId,
                messageId: messageId,
                conversationId: conversationId,
                category: category,
                userId: userId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $MessagesMetasProcessedTableManager =
    ProcessedTableManager<
      _$FtsDatabase,
      MessagesMetas,
      MessagesMeta,
      $MessagesMetasFilterComposer,
      $MessagesMetasOrderingComposer,
      $MessagesMetasAnnotationComposer,
      $MessagesMetasCreateCompanionBuilder,
      $MessagesMetasUpdateCompanionBuilder,
      (
        MessagesMeta,
        BaseReferences<_$FtsDatabase, MessagesMetas, MessagesMeta>,
      ),
      MessagesMeta,
      PrefetchHooks Function()
    >;

class $FtsDatabaseManager {
  final _$FtsDatabase _db;
  $FtsDatabaseManager(this._db);
  $MessagesFtsTableManager get messagesFts =>
      $MessagesFtsTableManager(_db, _db.messagesFts);
  $MessagesMetasTableManager get messagesMetas =>
      $MessagesMetasTableManager(_db, _db.messagesMetas);
}

typedef FuzzySearchAllMessage$where =
    Expression<bool> Function(MessagesMetas m);
typedef FuzzySearchAllMessageWithAnchor$where =
    Expression<bool> Function(MessagesMetas m);
