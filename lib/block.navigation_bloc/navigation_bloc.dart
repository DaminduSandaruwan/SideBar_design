
import 'package:bloc/bloc.dart';
import 'package:sidebar_design/pages/homepage.dart';
import 'package:sidebar_design/pages/myaccountpage.dart';
import 'package:sidebar_design/pages/myorderspage.dart';

enum NavigationEvents{
  HomePageClientEvent, 
  MyAccountedClickEvent,
  MyOrdersClickedEvent, 
}

abstract class NavigationStates{

}
class NavigationBloc extends Bloc<NavigationEvents, NavigationStates>{
  @override
  NavigationStates get initialState => HomePage();
  

  @override
  Stream<NavigationStates> mapEventToState(event) async* {
    switch(event){
      case NavigationEvents.HomePageClientEvent: 
        yield HomePage();
        break;
      case NavigationEvents.MyAccountedClickEvent: 
        yield MyAccountPage();
        break;
      case NavigationEvents.MyOrdersClickedEvent: 
        yield MyOrdersPage();
        break;

    }
  }

}