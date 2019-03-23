var teamScore = 0
let playerScore = [100,95,93,94,96,40,42,41]

for score in playerScore {
    if score > 50 {
      teamScore += 3
    }else{
      teamScore -= 1
    }
}
print(teamScore)