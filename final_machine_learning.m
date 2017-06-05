M = csvread('/Users/ychern/Downloads/MATLAB_Project/Momo.csv');

% Washing Data and choosing Training set
TF1 = M(:,13) >= 10000;     % remove aberrant indeg user data
TF2 = M(:,14) >= 2000;      % remove aberrant outdeg user data
TFall = TF1 | TF2;
M(TFall,:) = [];
length_M = length(M);
M1 = M(1:floor(length_M/2),:);
M2 = M(floor(length_M/2)+1:length_M,:);
csvwrite('momo_washed_training.csv',M1)
csvwrite('momo_washed_test.csv',M2)

%%
M1 = readtable('Momo_washed_training.csv');
M2 = readtable('Momo_washed_test.csv');
variable_name = {'id' 'year' 'month' 'day' 'gender' 'age' 'svip_valid' 'vip_valid' 'feed_count' 'book_count' 'music_count' 'movie_count' 'indeg' 'outdeg' 'spam'};
M1.Properties.VariableNames = variable_name;
M2.Properties.VariableNames = variable_name;
id = M1(:,1);
year = M1(:,2);
month = M1(:,3);
day = M1(:,4);
gender = M1(:,5);
age = M1(:,6);
svip_valid = M1(:,7);
vip_valid = M1(:,8);
feed_count = M1(:,9);
book_count = M1(:,10);
music_count = M1(:,11);
movie_count = M1(:,12);
indeg = M1(:,13);
outdeg = M1(:,14);
spam = M1(:,15);
N = M1(M1.spam == 0,1:14);

%% Manually use Classification Learner App to train model

% The whole process is described in the paper. And you can find help from
% documents if you don't know how to excute the process.


%% Export training result
hFigs = findall(groot,'type','figure');
saveas(hFigs(2),'comfusion_matrix_bagged_tree_model','jpeg') % label might vary according to hFigs values
saveas(hFigs(1),'roc_curve_bagged_tree_model','jpeg') % label might vary accoriding to hFigs values

%% Predicting Result from test set
trainClassifier(M2)
yfit = trainedClassifier.predictFcn(M2);
M2_spam = M2.spam;
result = (yfit == M2_spam);
prediction_correct_percentage = sum(result)/length(result);