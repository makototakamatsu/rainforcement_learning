#行動選択
selectAction <- 
  function(s, numA, Qt)
{
  qa <- Qt[s,]
  max_indexes <- (1:length(qa))[qa==max(qa)]
  if(length(max_indexes) == 1){
    max_indexes
  }else{
    max_indexes[sample(length(max_indexes), 1)]
  }
}
epsilonGreedy <- function(epsilon, numA, s, Qt)
{
  if(runif(1) < epsilon)
  {
    sample.int(numA, 1)
  }else{
    selectAction(s, numA, Qt)
  }
}
nextState <- function(s, a)
{  
  ifelse(a==1, ifelse(s==1, 2, 1), s)
}
calcReward <- function(s, a, net)
{
  ifelse(a!=1 && s==1, net, 0)
}
Qlearning <- function()
{
  numA <- 2
  numS <- 2
  alpha <- 0.3
  gamma <- 0.5
  epsilon <- 0.1
  trialMax <- 10000
  stepMax <- 10
  net <- 10
  s = 1
  Qt <- matrix(0, numS, numA)
  
  for(i in 1:trialMax)
  {
    for(j in 1:stepMax)
    {
      a <- epsilonGreedy(epsilon, numA, s, Qt)
      sd <- nextState(s, a)
      reward <- calcReward(s, a, net)
      Qt[s, a] <- (1 - alpha)*Qt[s, a] + alpha*(reward + gamma*max(Qt[sd,]))
      
      if(reward > 0){
        s <- 1
        break
      } else{
        s <- sd        
      }
    }
  }
  Qt
}
