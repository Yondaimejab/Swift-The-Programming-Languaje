let scoresArray = [1,2,3,4,5,6]
func getBiggerScore(scoreList scores: [Int]) -> (Int){
  var biggerScore = 0
  for score in scores{
    if score > biggerScore{
      biggerScore = score
    }
  }
  return biggerScore
}

func getSmallerScore(scoreList scores: [Int]) -> (Int){
  var smallerScore = getBiggerScore(scoreList: scores)
  
  for score in scores{
    if score < smallerScore{
      smallerScore = score
    }
  }
  return smallerScore
}

func sumIntCollection(scoreList scores: [Int]) -> (Int){
  var sum = 0
  for score in scores{
    sum += score
  }
  return sum
} 

func getScores(scoreList scores: [Int]) -> (min: Int, max: Int, sum: Int ){
  let max = getBiggerScore(scoreList: scores)
  let min = getSmallerScore(scoreList: scores)
  let sum = sumIntCollection(scoreList: scores)
  return (min,max,sum)
}

var tupla = getScores(scoreList: scoresArray);
print(tupla.min)
print(tupla.max)
print(tupla.sum)