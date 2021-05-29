// Named Parameters
// {param1, param2, ...}のように関数宣言すると、named parametersになる
// 関数呼び出し時に、string: 'stringggggg', のように呼び出す
void namedParameterFunction({String? string, required int widget}) {
  print(string);
}

String say(String from, String msg, [String? device]) {
  var result = '$from says $msg';

  if (device == null) return result;

  result = '$result with a $device';
  return result;
}

void printElement(int element) {
  print(element);
}

void printInteger(int aNumber) {
  print('The number is $aNumber');
}

Function makeAdder(int addBy) {
  return (int i) => addBy + i;
}

void main() {
  // varは型推論を行い、代入した型になる
  var number = 42;
  // 関数呼び出し
  printInteger(number);

  // null許容型をnull非許容型に代入する(nullの場合例外)
  int? nullable = null;
  // int nonNullable = nullable!;
  print(nullable);

  // late modifier(変数の初期化を遅延させる)
  late String description;
  description = 'Feijoada!';
  print(description);

  // finalはプログラム開始後一度だけ初期化
  // 参照先の変更は可能
  final List<int> finalList = [1, 2, 3];
  finalList[0] = 4; // OK
  print(finalList);

  // constはコンパイル時に初期化
  // 参照先の変更は不可
  const List<int> constList = [1, 2, 3];
  // constList[0] = 4; // NG
  print(constList);

  const int bar = 1000;
  const double atm = 1.01325 * bar;
  print(atm);

  var foo = const [];
  const baz = []; // const []と同等

  foo = [1, 2, 3]; // const []で初期化した場合も型自体はconstではないので再代入可能

  // type checks, cast, collection if, spread operators
  const Object i = 3;
  const list = [i as int]; // 型キャスト
  const map = {if (i is int) i: 'int'}; // 型チェックとcollection if
  const set = {if (list is List<int>) ...list}; // スプレッド演算子(...)

  // num型はintとdoubleの両方を持つことができる
  num x = 1;
  x += 2.5;

  // double型は必要に応じてdouble値に変換される
  double z = 1; // double z = 1.0と同等

  // String -> intの変換
  var one = int.parse('1');
  assert(one == 1);

  // String -> doubleの変換
  var onePointOne = double.parse('1.1');
  assert(onePointOne == 1.1);

  // int -> Stringの変換
  String oneAsString = 1.toString();
  assert(oneAsString == '1');

  // double -> Stringの変換(小数点以下指定)
  String piAsString = 3.14159.toStringAsFixed(2);
  assert(piAsString == '3.14');

  // シフト演算
  assert((3 << 1) == 6); // 0011 << 1 == 0110
  assert((3 >> 1) == 1); // 0011 >> 1 == 0001
  assert((3 | 4) == 7); // 0011 | 0100 == 0111
  assert((3 | 2) == 3); // 0011 | 0010 == 0011

  // シングルクオートとダブルクオート
  var s1 = 'Single quotes';
  var s2 = "Double quotes";
  var s3 = 'It\'s ok'; // ''の途中に'を使いたい場合は、\'とする
  var s4 = "It's ok";

  // Stringの連結
  // 文字列リテラルを隣接させることで、文字列を連結できる
  var concatString = 'String '
      'concatenation'
      " works even over line breaks.";
  print(concatString);

  // boolによるチェック
  var fullName = '';
  assert(fullName.isEmpty);

  var iMeantToDoThis = 0 / 0;
  assert(iMeantToDoThis.isNaN);

  // リスト
  var list1 = [1, 2, 3]; // type => List<int>
  var list2 = [
    'Car',
    'Boat',
    'Plane',
  ]; // コレクション内の最後のリテラルにコンマを付けても問題ない（コピペミス防止できる）

  var list3 = [0, ...list1]; // [0, 1, 2, 3]

  // スプレッド演算子を使う際にnullを含む可能性がある場合、...?を使うとnullならスキップできる
  List<int>? nullableList = null;
  var list4 = [0, ...?nullableList]; // [0]

  var list5 = [
    'Home',
    'Furniture',
    if (true) 'Plants',
    if (false) 'Outlet',
  ]; // ['Home', 'Furniture', 'Plants',]

  var listOfInts = [1, 2, 3];
  var listOfStrings = [
    '#0',
    for (var i in listOfInts) '#$i',
  ]; // [#0, #1, #2, #3]
  print(listOfStrings);

  // セット
  var halogens = {'fluorine', 'chlorine', 'bromine'};
  var names = <String>{};
  // Set<String> names = {}; // この宣言でも可
  // var names = {}; // マップの宣言、セットではない

  var elements = <String>{};
  elements.add('fluorine');
  elements.addAll(halogens);
  print(elements); // {'fluorine', 'chlorine', 'bromine'}

  final constantSet = const {
    'fluorine',
    'chlorine',
  };
  // constantSet.add('bromine'); // const指定されたセットにaddできない

  var gifts = {
    // key: value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings',
  };

  var gifts2 = Map<String, String>();
  gifts2['first'] = 'partridge';
  gifts2['second'] = 'turtledoves';
  gifts2['fifth'] = 'golden rings';
  assert(gifts2['fifth'] == 'golden rings');
  assert(gifts2.length == 3);
  assert(gifts2['sixth'] == null);

  namedParameterFunction(string: 'ssstrrr', widget: 0);

  print(say('Bob', 'Howdy', 'iPhone'));

  var list6 = [1, 2, 3];
  list6.forEach(printElement);

  void Function(int) count = (count) => print(count);
  [10, 11, 12].forEach(count);

  var add2 = makeAdder(2);
  assert(add2(3) == 5);
}
