%Initialisation of a trail
%State variables: taxiLocation {1, ..., 25}, 


%%
clear;
clc;
gridsize = 25;
initTaxi = 280;%randi([1, gridsize*gridsize]); %Taxi is uniformly randomly in any of the grid squares
goalLocations = [1,gridsize,(gridsize*(gridsize-1))+1,gridsize*gridsize];
weights = rand(25,4); %weights
sigma = sqrt(1/(2*pi));
inite = 0.7; % probability of exploration
discountFactor = 0.8;
counts =  zeros(25,4); %count of actions at each state or gridlocation 
episodes = 1000;
lr = 0.5; % learning rate
cummulativeReward = zeros(episodes,1);
totalReward = zeros(episodes,1);

initTaxi  


%%
for episode=0:1:episodes-1
    taxiLocation = initTaxi;    
    goalReached = false;
    timeLimit = 700;        
    e = inite * (.04^episode);
    tr=0;
    
    while goalReached == false && timeLimit > 0 
        reward = 0;
        oldLocation = taxiLocation;
        fn = radialBasisFunction(oldLocation,gridsize,sigma);
        [maxim oldpos] = max(fn);
        action = chooseArm(e, weights(oldpos,:)); %returns the index of the arm chosen
        count = counts(oldpos,action); %gets the number of times this arm has been used
       
        Q = fn' * weights(:,action); %get the current Q state-action value
        
        %make a move
        [taxiLocation,successfulMove] = attemptMove(oldLocation,action,gridsize); 
        
        %sprintf('From Position %d Move made (%d) Taxi position %d , episode: %d',oldLocation,action,taxiLocation,episode)  
       
        %get reward
        goalReached = ~isempty(find(taxiLocation == goalLocations,1));       
          
        if goalReached
            reward =1;
            %sprintf('Goal Reached, episode: %d',episode)            
        end
        
        newfn =radialBasisFunction(taxiLocation,gridsize,sigma);
        [maxim newpos] = max(newfn);
        nextOptimum = max(weights(newpos,:));
        difference = (reward + ((discountFactor*nextOptimum)- Q));
        %adjust the weight that had the highest contribution
        Qnew = weights(:,action) + (lr * difference* fn); %
        weights(:,action) = Qnew;
        counts(oldpos,action)= count + 1;
        tr=tr+reward;
        timeLimit = timeLimit - 1; %reduce time limit
    end
    cummreward = sum(weights,2);
    cummulativeReward(episode+1,1) = mean(cummreward);
    totalReward(episode+1,1)=tr;
end

[maxrewards,policy] = max(weights,[],2);

%%
figure
plot(cummulativeReward(1:episodes,1))

title('2-D Line Plot of Average reward using QLearning & tiled Radial Basis Functions')
xlabel('Episodes')
ylabel('Average Reward')