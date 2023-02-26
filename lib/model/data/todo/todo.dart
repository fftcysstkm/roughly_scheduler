import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jiffy/jiffy.dart';

part 'todo.freezed.dart';

@freezed
class Todo with _$Todo {
  // 空のコンストラクタ(feezedでgetterの定義に必要)
  // ignore: unused_element
  const Todo._();

  factory Todo({
    // id
    required String id,
    // タイトル
    required String title,
    // お知らせ間隔
    required NotificationDuration duration,
    // お知らせを繰り返すかどうか
    required bool isRepeated,
    // メモ(任意)
    String? memo,
    // todoを実行すべき日付
    required DateTime dateTodo,
    // アーカイブ済みか(このアプリではアーカイブ≒完了済みとする)
    required bool isArchived,
  }) = _Todo;

  // 期限のカテゴリを取得するgetter
  DeadLine get deadLine {
    // やるべき日付と現在時刻の差に応じた期限ラベルを取得する
    final dateTodoJiffy = Jiffy(dateTodo);
    final today = Jiffy(DateTime.now());

    // 1,2,3,4週間以内
    if (dateTodoJiffy.diff(today, Units.WEEK) <= 1) {
      return DeadLine.withinAWeek;
    }
    if (dateTodoJiffy.diff(today, Units.WEEK) <= 2) {
      return DeadLine.withinTwoWeeks;
    }
    if (dateTodoJiffy.diff(today, Units.WEEK) <= 3) {
      return DeadLine.withinThreeWeeks;
    }
    if (dateTodoJiffy.diff(today, Units.WEEK) <= 4) {
      return DeadLine.withinFourWeeks;
    }

    // 1ヶ月以上先
    return DeadLine.overAMonthAhead;
  }

  // 通知まであと何日かを取得する
  int daysLeft() {
    final dateTodoJiffy = Jiffy(dateTodo);
    final today = Jiffy(DateTime.now());
    return dateTodoJiffy.diff(today, Units.DAY).toInt();
  }

  // 通知間隔の文字列を取得するg
  String durationString() {
    final year = duration.year;
    final month = duration.month;
    final week = duration.week;

    // 通知間隔の文字列を作成する
    final durationString = StringBuffer();
    if (year > 0) {
      durationString.write('$year年');
    }
    if (month > 0) {
      durationString.write('$monthヶ月');
    }
    if (week > 0) {
      durationString.write('$week週');
    }
    return durationString.toString();
  }
}

/**
 * お知らせ間隔クラス
 */
class NotificationDuration {
  // コンストラクタ
  NotificationDuration({
    required this.year,
    required this.month,
    required this.week,
  });
  // 年月日
  final int year;
  final int month;
  final int week;
}

// ignore: slash_for_doc_comments
/**
 * grouped_listのラベルに使う、期限のenum。
 * 1週間以内、2週間以内、3週間以内、4週間以内、1ヶ月以上先の5つの期限を使用する
 *
 */
enum DeadLine {
  // 1週間以内
  withinAWeek('1週間以内', 1),
  // 2週間以内
  withinTwoWeeks('2週間以内', 2),
  // 3週間以内
  withinThreeWeeks('3週間以内', 3),
  // 4週間以内
  withinFourWeeks('4週間以内', 4),
  // 1ヶ月以上先
  overAMonthAhead('1ヶ月以上先', 5);

  final String label;
  final int displayOrder;
  const DeadLine(this.label, this.displayOrder);

  // ラベル文字列からenum自体を逆引きする
  static DeadLine getDeadLineByLabel(String label) {
    return DeadLine.values.firstWhere((deadLine) => deadLine.label == label);
  }
}

// テスト用データ
final testTodos = [
  Todo(
      id: '1',
      title: '電動歯ブラシのブラシ交換',
      duration: NotificationDuration(year: 0, month: 2, week: 0),
      isRepeated: true,
      dateTodo: DateTime(2023, 1, 12),
      isArchived: false),
  Todo(
      id: '2',
      title: '歯医者(定期検診)',
      duration: NotificationDuration(year: 0, month: 6, week: 0),
      isRepeated: true,
      dateTodo: DateTime(2023, 2, 2),
      isArchived: false),
  Todo(
      id: '3',
      title: '魚のフィルター交換',
      duration: NotificationDuration(year: 0, month: 3, week: 0),
      isRepeated: true,
      dateTodo: DateTime(2023, 1, 27),
      isArchived: false),
  Todo(
      id: '4',
      title: '冷蔵庫の掃除',
      duration: NotificationDuration(year: 0, month: 1, week: 0),
      isRepeated: true,
      dateTodo: DateTime(2023, 3, 16),
      isArchived: false),
  Todo(
      id: '5',
      title: 'PCのファンの掃除',
      duration: NotificationDuration(year: 0, month: 3, week: 0),
      isRepeated: true,
      dateTodo: DateTime(2023, 12, 17),
      isArchived: false),
  Todo(
      id: '6',
      title: '電動シェーバーの刃交換',
      duration: NotificationDuration(year: 2, month: 0, week: 0),
      isRepeated: true,
      dateTodo: DateTime(2023, 1, 7),
      isArchived: true),
  Todo(
      id: '7',
      title: '空気清浄機のフィルター交換',
      duration: NotificationDuration(year: 1, month: 0, week: 0),
      isRepeated: true,
      dateTodo: DateTime(2023, 1, 7),
      isArchived: true)
];
