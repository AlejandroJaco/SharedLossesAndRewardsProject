function trial = JacoRandomPermutation4(sgt,n,trialList)

% Takes 1-2 inputs. The first input is a category and there are four options
% "self", "group", "bot", and "all". This input is to decide the type of trial
% you want to receive pseudo-random permutations of.  The second input controls 
% the number of trials the program outputs (note that the number 
% of trials per execution is 6 per category) this can be left blank if you 
% only want to run the program once, or it can be any number. The example
% below outputs 18 trials of each category, totaling 54.
%
%                  JacoRandomPermutation3(?all?, 3);                  


%%catergory types
self = [zeros(1,6)]; %self condition
groupNum = [1:6]; %social condition
botNum = [1:6]; %non-social control
zero = [zeros(1,6)];

safeBet = 5; %default, safe'ish bet not used in code
altBet = [6 12 25 6 12 25 ]; %possible alt options to be presented randomly

%probabilities for both options, meant to allways add up to 100%
safeBetProb = [50 65 85 50 65 85]; 

% The function chooses pseudo-random variables from a finite set of options
% each call to the function uses a different rng seed based on the current time
% at a sub-second resolutiond. The function makes 6 permutations of each
% trial category

rng shuffle;
randAltBet1 = randperm(length(altBet));
randAltBet2 = randperm(length(altBet));
randAltBet3 = randperm(length(altBet));

randGroupNum = randperm(length(groupNum));
randBotNum = randperm(length(botNum));
randSafeBetProb1 = randperm(length(safeBetProb));
randSafeBetProb2 = randperm(length(safeBetProb));
randSafeBetProb3 = randperm(length(safeBetProb));

randSafeBetProb_1 = safeBetProb(randSafeBetProb1);
randSafeBetProb_2 = safeBetProb(randSafeBetProb2);
randSafeBetProb_3 = safeBetProb(randSafeBetProb3);


selfTrial = [self; zero; altBet(randAltBet1); (100 - randSafeBetProb_1)];
groupTrial = [groupNum(randGroupNum);zero; altBet(randAltBet2); 100 - randSafeBetProb_2];
botTrial = [zero; botNum(randBotNum); altBet(randAltBet3);100 - randSafeBetProb_3];

trial = []';
trialList = [];

if (sgt == "self")
    trial = selfTrial;
    elseif (sgt == "group")
        trial = groupTrial;
    elseif (sgt == "bot")
        trial = botTrial;
    elseif (sgt == "all")
        trial = [selfTrial; groupTrial; botTrial];
end

if (isa(trialList, "double"))
    trialList = [trial; trialList]';
end
    
n = 0;
if (n > 0)
    for i = 2:n
        JacoRandomPermutation3(sgt,n - 1,trialList);
    end
end
if (n > 0)
    trial = [trial; trialList]';
end
count = [1:length(trial)];
trial = [count; trial];

fileID = fopen('trailList.txt','w');
fprintf(fileID,'%d %d %d %d\n',trial)';
fclose(fileID);



end