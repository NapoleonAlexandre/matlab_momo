%% Data loading and initialization
M = csvread('/Users/ychern/Downloads/MATLAB_Project/Momo.csv');
TF1 = M(:,13) >= 10000;
TF2 = M(:,14) >= 2000;
TFall = TF1 | TF2;
M(TFall,:) = [];
TF3 = M(:,15) == 1;
M(TF3,:) = [];  % Delete data from spam users;
length_M = length(M);
M = M(1:floor(length_M/2),:);
M = M(M(:,15)==0,1:15);
ID = M(:,1);
Register_year = M(:,2);
Register_month = M(:,3);
Register_day = M(:,4);
Gender = M(:,5);
Age = M(:,6);
Svip_valid = M(:,7);
Vip_valid = M(:,8);
feed_count = M(:,9);
book_count = M(:,10);
music_count = M(:,11);
movie_count = M(:,12);
indeg = M(:,13);
outdeg = M(:,14);
spam = M(:,15);

%% Gender Analysis
gender_count = [sum(Gender),length(Gender)-sum(Gender)];
figure;
pie3(gender_count,{'Male','Female'});
title('Users by Gender Refurbished in Training Set')
saveas(gcf,'Gender_Analysis_refurbished_training','jpeg');


%% Age Analysis
nbins_1 = max(Age)-min(Age)+1;
figure;
hist(Age,nbins_1);
title('Users by Age Refurbished in Training Set')
xlabel('Age')
ylabel('User numbers')
saveas(gcf,'Age_histogram_refurbished_training','jpeg');

user_count_11to20 = sum(Age>=11 & Age<=20);
user_count_21to30 = sum(Age>=21 & Age<=30);
user_count_31to40 = sum(Age>=31 & Age<=40);
user_count_41to50 = sum(Age>=41 & Age<=50);
user_count_51to60 = sum(Age>=51 & Age<=60);
user_count_61to70 = sum(Age>=61 & Age<=70);
user_count_71to80 = sum(Age>=71 & Age<=80);
user_count_81to90 = sum(Age>=81 & Age<=90);
user_count_over_90 = sum(Age >= 90);
user_count_all = [user_count_11to20 user_count_21to30 user_count_31to40 user_count_41to50+user_count_51to60+user_count_61to70+user_count_71to80+user_count_81to90+user_count_over_90];
figure;
explode = [0 1 0 0];
pie(user_count_all,explode,{'10-20','21-30','31-40','>40'})
title('Users Among Different Age Groups Refurbished in Training Set')
saveas(gcf,'Age_group_refurbished_training','jpeg')

book_count_11to20 = book_count(Age >= 11 & Age <= 20);
book_mean_11to20 = mean(book_count_11to20);
movie_count_11to20 = movie_count(Age >= 11 & Age <= 20);
movie_mean_11to20 = mean(movie_count_11to20);
music_count_11to20 = movie_count(Age >= 11 & Age <= 20);
music_mean_11to20 = mean(music_count_11to20);

book_count_21to30 = book_count(Age >= 21 & Age <= 30);
book_mean_21to30 = mean(book_count_21to30);
movie_count_21to30 = movie_count(Age >= 21 & Age <= 30);
movie_mean_21to30 = mean(book_count_21to30);
music_count_21to30 = movie_count(Age >= 21 & Age <= 30);
music_mean_21to30 = mean(music_count_21to30);

book_count_31to40 = book_count(Age >= 31 & Age <= 40);
book_mean_31to40 = mean(book_count_31to40);
movie_count_31to40 = movie_count(Age >= 31 & Age <= 40);
movie_mean_31to40 = mean(book_count_31to40);
music_count_31to40 = movie_count(Age >= 31 & Age <= 40);
music_mean_31to40 = mean(music_count_31to40);

book_count_over40 = book_count(Age >= 40);
book_mean_over40 = mean(book_count_over40);
movie_count_over40 = movie_count(Age >= 40);
movie_mean_over40 = mean(book_count_over40);
music_count_over40 = movie_count(Age >= 40);
music_mean_over40 = mean(music_count_over40);

figure;
str = {'11-20'; '21-30'; '31-40';'over 40'};
Y = [book_mean_11to20, movie_mean_11to20, music_mean_11to20;
    book_mean_21to30, movie_mean_21to30, music_mean_21to30;
    book_mean_31to40, movie_mean_31to40, music_mean_31to40;
    book_mean_over40, movie_mean_over40, music_mean_over40];
bar(Y)
l = legend('book','movie','music','Location','NorthEast');
set(l,'FontSize',16)
title('Average Book/Movie/Music Collections among Different Age Group Refurbished in Training Set');
set(gca, 'XTickLabel',str,'XTick',1:numel(str));
saveas(gcf,'Avg_book_movie_music_collections_refurbished_training','jpeg')




%% Comment Analysis
% First show relationship between comments and genders.
average_female_indeg = mean(indeg(Gender == 0));
average_female_outdeg = mean(outdeg(Gender == 0));
average_male_indeg = mean(indeg(Gender == 1));
average_male_outdeg = mean(indeg(Gender == 1));

Y1 = [average_female_indeg,average_female_outdeg;
    average_male_indeg,average_male_outdeg];
figure;
str ={'Female','Male'};
bar(Y1);
l1 = legend('comments received','comments given');
title('Average Comments Received/Given by Different Genders Refurbished in Training Set')
set(gca,'XTickLabel',str);
saveas(gcf,'comments_by_gender_refurbished_training','jpeg');

save('final_refurbished_training_ver1.mat')




