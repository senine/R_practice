## Lets make a deal: Three door game simulations, inputs are Number of Trails and Strategies (Stay or Change).
## Output are winning counts, and 
## N is the number of trails, a positive integer; STG is the chosen strategy, 0 meaning stay, 1 change to the other remained door.

deal <- function (N, STG) {
  wins <- 0 # wins count for selected strategy.
  doors <- 1:3 # Three doors
  for (i in 1:N) {
    initial <- sample(1:3,2,T) # set initial conditions, first element is the location of the prize, the second player's initial selection.
    remove <- ifelse(length(doors[-initial]) == 2,sample(doors[-initial],1),doors[-initial]) # eliminate one option, note undisired result of the sample function if length(x) ==1.
    
    if (STG == 0) {
      wins <- ifelse(initial[2] == initial[1],wins + 1, wins)
    }
    if (STG == 1) {
      wins <- ifelse(doors[-c(remove,initial[2])] == initial[1],wins + 1, wins)
    }
    
  }

  return(wins)
}


## Given that wins counts the number of winnings in an repeated experiment, it follows a binomial dist; however, the parameters are unknown. To cope with this problem, we use sample means and deviation to replace dist expectation and variance.
## According to CLT, the means from a repeated sampling follows a normal distribution in convergence.

deal.CI <-function(x,N,STG) {
  outcome <- vector(length = x)
  ## how to vectorize the following?
  for (i in 1:x) {
    outcome[i] <- deal(N,STG)
  }
  
  mean <- mean(outcome)
  std <- sd(outcome)

  error <- qnorm(.975)*std/sqrt(x) # to calculate .95 CI
  
  left <- mean - error
  right <- mean + error
  
  interval <- c(left,right)
  
  return(interval)
}

deal.CI(100,10000,0)
deal.CI(100,10000,1)