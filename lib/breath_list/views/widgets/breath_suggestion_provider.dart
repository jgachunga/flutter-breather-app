class BreathSuggestionProvider {
  List listOfBreathTime = [];

  List listBreathTime (maxCount) {
    for(var i=1; i<maxCount; i++){
      var breathTime = {
        'timeLabel' : '$i seconds',
        'value' : i
      };
      listOfBreathTime.add(breathTime);
    }
    return listOfBreathTime;
  }

}