## the game of craps
## throw two dice, 7 or 11 wins; 2,3 or 12 loss.
## if none of above occurs, a Point is established, and the player continues to throw till meet the Point (win) or a Seven (loss).

craps <- function (N) {
  wins <- 0
  for (i in 1:N) {
    initial <- sum(sample(1:6,2,T)) # outcome of first experiment
    if (any(initial == c(2,3,7,11,12))) {
      if (any(initial == c(7,11))) wins <- wins + 1     
    } else {
      repeat {
        continue <- sum(sample(1:6,2,T))
        if (any(continue == c(7,initial))) {
          if (continue == initial) wins <- wins + 1
          break
        }            
      }
    }    
  }
  return(wins)
}

craps(1000)