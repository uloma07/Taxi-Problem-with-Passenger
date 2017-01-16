%Initialisation of a trail
%State variables: taxiLocation {1, ..., 25}, 


%%
clear;
clc;
gridsize = 10;
initTaxi = randi([1,100]); %Taxi is uniformly randomly in any of the 25 grid squares
goalLocations = [1,10,91,100];
weights = 0.3 * ones(25,4); %weights
inite = 0.9; % probability of exploration
discountFactor = 0.5;
counts =  zeros(25,4); %count of actions at each state or gridlocation 
episodes = 1000;
lr = 0.6; % learning rate
cummulativeReward = zeros(episodes,1);
totalReward = zeros(episodes,1);

%%
for episode=1:1:episodes
    taxiLocation = initTaxi;    
    goalReached = false;
    timeLimit = 600;        
    e = inite * (.5^(episode-1));
    tr=0;
    
    while goalReached == false && timeLimit > 0 
        reward = 0;
        oldLocation = taxiLocation;
        scaledfn = scaledIndicator(oldLocation,gridsize,gridsize);
        oldpos = find(1==scaledfn,1);%returns the index of the arm chosen
        action = chooseArm(e, weights(oldpos,:)); 
        count = counts(oldpos,action); %gets the number of times this arm has been used
       
        Q = scaledfn' * weights(:,action); %get the current Q state-action value
        
        %make a move
        [taxiLocation,successfulMove] = attemptMove(oldLocation,action,gridsize); 
        
        goalReached = ~isempty(find(taxiLocation == goalLocations,1));       
          
        if goalReached
            %get reward
            reward =1;
            %sprintf('Goal Reached, episode: %d',episode)            
        end
        
        newpos = find(1==scaledIndicator(taxiLocation,gridsize,gridsize),1);
        nextOptimum = max(weights(newpos,:)); % value of state s'
        difference = (reward + ((discountFactor*nextOptimum)- Q));
        %adjust the weight that made the contribution
        Qnew = weights(:,action) + ((1/timeLimit) * difference* scaledfn); %
        weights(:,action) = Qnew;
        counts(oldpos,action)= count + 1;
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
plot(cummulativeReward(1:episodes,1))

title('2-D Line Plot of Average reward using QLearning & tiled Indicator Functions')
xlabel('Episodes')
ylabel('Average Reward')