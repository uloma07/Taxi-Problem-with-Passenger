%Initialisation of a trail
%State variables: taxiLocation {1, ..., 25}, 


%%
clear;
clc;
initTaxi = randi([1, 25]); %Taxi is uniformly randomly in any of the 25 grid squares
goalLocations = [1,5,21,25];
rewards = 1*ones(25,4); %initialise average reward gotten when each action is taken
inite = 0.7; % probability of exploration
lr = 0.8; % learning rate
discountFactor = 0.95;
counts =  zeros(25,4); %count of actions at each state or gridlocation 
episodes = 1000;
cummulativeReward = zeros(episodes,1);
totalReward = zeros(episodes,1);
wait = 10;
initTaxi  


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
        action = chooseArm(e, rewards(oldLocation,:)); %returns the index of the arm chosen
        count = counts(oldLocation,action); %gets the number of times this arm has been used
        Q = rewards(oldLocation,action); %get the current Q state-action value
        
        %make a move
        [taxiLocation,successfulMove] = attemptMove(oldLocation,action,5); 
        
        %get reward
        goalReached = ~isempty(find(taxiLocation == goalLocations,1));       
          
        if goalReached
            reward =1;
            %sprintf('Goal Reached, episode: %d',episode)            
        end           
        nextOptimum = max(rewards(taxiLocation,:));
        Qnew = Q + lr *(reward + ((discountFactor*nextOptimum)- Q));
        rewards(oldLocation,action) = Qnew;
        counts(oldLocation,action)= count + 1;
        tr=tr+reward;
        timeLimit = timeLimit - 1; %reduce time limit
    end
    cummreward = sum(rewards,2);
    cummulativeReward(episode,1) = mean(cummreward);
    totalReward(episode,1)=tr;
    
    %convergence
    %if episode > 1
    %    if cummulativeReward(episode,1)- cummulativeReward(episode-1,1) < 0.0001
    %        if wait == 0
    %           sprintf('Final episode: %d',episode)
    %           sprintf('Average cummulative reward: %d',cummulativeReward(episode,1))
    %         break;
    %       else
    %           wait = wait -1;
    %       end
    %   end  
    %end
end

[maxrewards,policy] = max(rewards,[],2);

%%
figure
plot(cummulativeReward(1:100,1))

title('2-D Line Plot of Average reward using QLearning Lookup')
xlabel('Episodes')
ylabel('Average Reward')

