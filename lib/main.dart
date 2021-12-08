import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()=>runApp(ExampleApp());

class Counter extends ChangeNotifier{
  int _count=0;
  getCounter() => _count;
  void increment() {
    _count++;
    notifyListeners(); // 값이 변할 때마다 플러터 프레임워크에 알려줍니다.
  }
}

//Provider는 제일 기본적인 Provider를 생성하는 방법
/*ChangeNotifierProvider도 Provider를 생성하는 방법 중 하나로 ChnageNotifier의 notifyListeners()를 기다리다가, 을
 notifyListeners()가 호출되면, 자신의 자식을 재빌드하여 UI를 업데이트해준다.
*/
class ExampleApp extends StatelessWidget {
//  const S({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>(
        create: (_)=>Counter(),
      child:MaterialApp(
        home:Example(),
      ),
    );
  }
}

class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Example'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text(
            '현재 숫자:${Provider.of<Counter>(context)._count}'
            //${Provider.of<Counter>(context)._count}
            // ${context.watch<Counter>()._count}
          ), // watch 사용: 데이터 값이 변경되었을 때 위젯 재빌, Provider.of<T>(context)와 동일),
          onPressed: () {
            context.read<Counter>().increment(); // read 사용: 위젯 재빌드 X
          //${Provider.of<Counter>(context,listen:false)._count}
          },
        ),
      ),
    );
  }
}



