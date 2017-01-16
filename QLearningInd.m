%Initialisation of a trail
%State variables: taxiLocation {1, ..., 25}, 

%%
clear;
clc;
initTaxi = 13; 
goalLocations = [1,5,21,25];
weights = 1*ones(25,4); %weights
inite = 0.7; % probability of exploration
discountFactor = 0.95;
counts =  zeros(25,4); %count of actions at each state or gridlocation 
episodes = 1000;
lr = 0.8; % learning rate
cummulativeReward = zeros(episodes,1);
totalReward = zeros(episodes,1);


%%
for episode=1:1:episodes
    taxiLocation = initTaxi;    
    goalReached = false;
    timeLimit = 35;        
    e = inite * (.05^(episode-1));
    tr=0;
    
    while goalReached == false && timeLimit > 0 
        reward = 0;
        oldLocation = taxiLocation;
        action = chooseArm(e, weights(oldLocation,:)); %returns the index of the arm chosen
        count = counts(oldLocation,action); %gets the number of times this arm has been used
       
        Q = indicator(oldLocation)' * weights(:,action); %get the current Q state-action value
        
        %make a move
        [taxiLocation,successfulMove] = attemptMove(oldLocation,action,5);         
       
        %get reward
        goalReached = ~isempty(find(taxiLocation == goalLocations,1));       
          
        if goalReached
            reward =1;
            %sprintf('Goal Reached, episode: %d',episode)            
        end
               
        nextOptimum = max(weights(taxiLocation,:));
        difference = (reward + ((discountFactor*nextOptimum)- Q));
        Q = indicator(oldLocation)' * weights(:,action); %get the current Q state-action value
        Qnew = weights(:,action) + (lr * difference* indicator(oldLocation));
        weights(:,action) = Qnew;
        counts(oldLocation,action)= count + 1;
        tr=tr+reward;
        timeLimit = timeLimit - 1; %reduce time limit
    end
    cummreward = sum(weights,2);
    cummulativeReward(episode,1) = mean(cummreward);
    totalReward(episode,1)=tr;
end

[maxrewards,policy] = max(weights,[],2);

%%
figure
plot(cummulativeReward(1:100,1))

title('2-D Line Plot of Average reward using QLearning & Indicator Functions')
xlabel('Episodes')
ylabel('Average Reward')
