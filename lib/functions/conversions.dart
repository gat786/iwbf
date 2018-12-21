
//converting weight to Kilogram
getWeightInKg({weight,weightFormat,weightMeasures}){
  //already kilogram
  if (weightFormat == weightMeasures[0])
    return weight;
  //pounds to kilogram
  else if(weightFormat == weightMeasures[1])
    return weight / 2.205;
}

//converting height to Centimetre
getHeightInCm({height,heightFormat,heightMeasures}){
  //already centimetre
  if (heightFormat == heightMeasures[0])
    return height;
  //feet to cm
  else if(heightFormat == heightMeasures[1])
    return height * 30.48;
  //metre to cm
  else if(heightFormat == heightMeasures[2])
    return height * 100;
}

//converting height to Metres
getHeightInMetres({height,heightFormat,heightMeasures}){
  //cm to metre
  if (heightFormat == heightMeasures[0])
    return height / 100;
  //foot to metre
  else if (heightFormat == heightMeasures[1])
    return height / 3.281;
  //already metre
  else if (heightFormat == heightMeasures[2])
    return height;
}