
import 'package:flutter/cupertino.dart';
import 'package:jobfinder/Controller/data/Network/dio.dart';

import '../../Model/search_model.dart';
class SearchProvider extends ChangeNotifier{
  String? value;
  int index = 0;
  final List<bool> searchhpages = [true, false, false];
  List<String> searchlist = [];
  List<String> searchresult = [];
  List<SearchModel> searchresults = [];
/* search(value,searchlist,searchresult) {
   searchresult.clear();
   for (int i = 0; i < searchlist.length; i++) {
     if (value == searchlist[i][0] || value == searchlist[i]) {
       searchresult.add(searchlist[i]);
       print(searchresult);
       if (index < 2) {
         index = index + 1;
         searchhpages[index - 1] = !searchhpages[index - 1];
         searchhpages[index] = !searchhpages[index];
         notifyListeners();
       }
       else {
         print("nosearchfound");
         notifyListeners();
       }
       notifyListeners();
     }
   }
   notifyListeners();
 }*/
searchapi(String name)
{
  GetDataSearch(name).then((value) {
    searchresults= value;

    notifyListeners();


      if(index<1) {
       index = index +1;
        searchhpages[index - 1] = !searchhpages[index - 1];
        searchhpages[index] = !searchhpages[index];
        notifyListeners();
      }





    notifyListeners();
  });

}
  filtersearchapi(String title,String location,String salary)
  {
    GetDataSearchfilter(title, location, salary).then((value) {
      searchresults= value;

      notifyListeners();


      if(index<1) {
        index = index +1;
        searchhpages[index - 1] = !searchhpages[index - 1];
        searchhpages[index] = !searchhpages[index];
        notifyListeners();
      }





      notifyListeners();
    });

  }
}
