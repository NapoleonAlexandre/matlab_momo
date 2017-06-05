%% Data loading and initialization
M = csvread('/Users/ychern/Downloads/MATLAB_Project/Momo.csv');
% Washing Data
TF1 = M(:,13) >= 10000;      % remove aberrant indeg user data
TF2 = M(:,14) >= 2000;       % remove aberrant outdeg user data
TFall = TF1 | TF2;
M(TFall,:) = [];

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
title('Users by Gender')
saveas(gcf,'Gender Analysis','jpeg');


%% Age Analysis
nbins_1 = max(Age)-min(Age)+1;
figure;
hist(Age,nbins_1);
title('Users by Age')
xlabel('Age')
ylabel('User numbers')
saveas(gcf,'Age histogram','jpeg');

% User grouping
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
title('Users among Different Age Groups')
saveas(gcf,'Age group','jpeg')

% collection analysis among age groups
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
l = legend('book','movie','music','Location','NorthWest');
set(l,'FontSize',16)
title('Average Book/Movie/Music Collections among Different Age Group');
set(gca, 'XTickLabel',str,'XTick',1:numel(str));
saveas(gcf,'Avg_book_movie_music_collections','jpeg')


%% Correlation between Age and Spam
% spam user grouping according to their age
spam_11to20 = spam(Age >= 11 & Age <= 20);
spam_percentage_11to20 = sum(spam_11to20)/length(spam_11to20);
spam_21to30 = spam(Age >= 21 & Age <= 30);
spam_percentage_21to30 = sum(spam_21to30)/length(spam_21to30);
spam_31to40 = spam(Age >= 31 & Age <= 40);
spam_percentage_31to40 = sum(spam_31to40)/length(spam_31to40);
spam_over40 = spam(Age >= 40);
spam_percentage_over40 = sum(spam_over40)/length(spam_over40);

% male spam user grouping
male_spam_11to20 = spam(Age >= 11 & Age <= 20 & Gender == 1);
male_spam_percentage_11to20 = sum(male_spam_11to20)/length(male_spam_11to20);
male_spam_21to30 = spam(Age >= 21 & Age <= 30 & Gender == 1);
male_spam_percentage_21to30 = sum(male_spam_21to30)/length(male_spam_21to30);
male_spam_31to40 = spam(Age >= 31 & Age <= 40 & Gender == 1);
male_spam_percentage_31to40 = sum(male_spam_31to40)/length(male_spam_31to40);
male_spam_over40 = spam(Age >= 40 & Gender == 1);
male_spam_percentage_over40 = sum(male_spam_over40)/length(male_spam_over40);

%female spam user grouping
female_spam_11to20 = spam(Age >= 11 & Age <= 20 & Gender == 0);
female_spam_percentage_11to20 = sum(female_spam_11to20)/length(female_spam_11to20);
female_spam_21to30 = spam(Age >= 21 & Age <= 30 & Gender == 0);
female_spam_percentage_21to30 = sum(female_spam_21to30)/length(female_spam_21to30);
female_spam_31to40 = spam(Age >= 31 & Age <= 40 & Gender == 0);
female_spam_percentage_31to40 = sum(female_spam_31to40)/length(female_spam_31to40);
female_spam_over40 = spam(Age >= 40 & Gender == 0);
female_spam_percentage_over40 = sum(female_spam_over40)/length(female_spam_over40);

figure;
Y = [spam_percentage_11to20*100; spam_percentage_21to30*100; spam_percentage_31to40*100; spam_percentage_over40*100];
str = {'11-20'; '21-30'; '31-40';'over 40'};
bar(Y);
ylabel('Normalized Count [%]')
set(gca, 'XTickLabel',str,'XTick',1:numel(str));
title('Spam User Percentages among Differen Ages');
saveas(gcf,'spam_user_percentage_among_different_ages','jpeg')

figure;
Y = [male_spam_percentage_11to20*100; male_spam_percentage_21to30*100; male_spam_percentage_31to40*100; male_spam_percentage_over40*100];
str = {'11-20'; '21-30'; '31-40';'over 40'};
bar(Y);
ylabel('Normalized Count [%]')
set(gca, 'XTickLabel',str,'XTick',1:numel(str));
title('Male Spam User Percentages among Differen Ages');
saveas(gcf,'male_spam_user_percentage_among_different_ages','jpeg')

figure;
Y = [female_spam_percentage_11to20*100; female_spam_percentage_21to30*100; female_spam_percentage_31to40*100; female_spam_percentage_over40*100];
str = {'11-20'; '21-30'; '31-40';'over 40'};
bar(Y);
ylabel('Normalized Count [%]')
set(gca, 'XTickLabel',str,'XTick',1:numel(str));
title('Female Spam User Percentages among Differen Ages');
saveas(gcf,'female_spam_user_percentage_among_different_ages','jpeg')


%% Spam User by Registration Year/Month/Day

% Only analysis on Register year, analysis on month and day not included
spam_by_year = Register_year(spam == 1);
spam_by_month = Register_month(spam == 1);
spam_by_day = Register_day(spam == 1);
non_spam_by_year = Register_year(spam == 0);
non_spam_by_month = Register_month(spam == 0);
non_spam_by_day = Register_month(spam == 0);

figure;
spam_by_year_labeled = categorical(spam_by_year,[2011 2012 2013 2014 2015 2016],{'2011','2012','2013','2014','2015','2016'});
histogram(spam_by_year_labeled);
hold on;
non_spam_by_year_labeled = categorical(non_spam_by_year,[2011 2012 2013 2014 2015 2016],{'2011','2012','2013','2014','2015','2016'});
histogram(non_spam_by_year_labeled);
legend({'spam users','non spam users'},'Location','NorthWest');
ylabel('User Amounts')
title('Spam/Non-spam User Amounts by Year');
saveas(gcf,'spam_nonspam_user_amounts_by_year','jpeg');


figure;
spam_by_year_labeled = categorical(spam_by_year,[2011 2012 2013 2014 2015 2016],{'2011','2012','2013','2014','2015','2016'});
h1 = histogram(spam_by_year_labeled);
hold on;
non_spam_by_year_labeled = categorical(non_spam_by_year,[2011 2012 2013 2014 2015 2016],{'2011','2012','2013','2014','2015','2016'});
h2 = histogram(non_spam_by_year_labeled);
ylabel('Normalized Probability');
legend({'spam users','non spam users'},'Location','NorthWest');
title('Normalized Spam/Non-spam User Amounts by Year');
h1.Normalization = 'probability';
h2.Normalization = 'probability';
saveas(gcf,'normalized_spam_nonspam_user_amounts_by_year','jpeg');

female_2016 = spam(Gender == 0 & Register_year == 2016);
female_2016_spam_probability = sum(female_2016)/length(female_2016);

male_2016 = spam(Gender == 1 & Register_year == 2016);
male_2016_spam_probability = sum(male_2016)/length(male_2016);


male_spam_year = Register_year(Gender == 1 & spam == 1);
male_year = Register_year(Gender == 1);
female_spam_year = Register_year(Gender == 0 & spam == 1);
female_year = Register_year(Gender == 0);

figure;
histogram(male_spam_year);
hold on;
histogram(male_year);
ylabel('Users amount')
legend({'spam users','all users'},'Location','NorthWest')
title('Male Spam Users vs All Users by Year')
saveas(gcf,'male_spam_users_by_year','jpeg');


figure;
histogram(female_spam_year);
hold on;
histogram(female_year);
ylabel('Users amount')
legend({'spam users','all users'},'Location','NorthWest')
title('Feale Spam Users vs All Users by Year')
saveas(gcf,'female_spam_users_by_year','jpeg');

%% Correlation between gender and spam

male_spam = spam(Gender == 1);
male_spam_percentage = sum(male_spam)/length(male_spam)*100;
female_spam = spam(Gender == 0);
female_spam_percentage = sum(female_spam)/length(female_spam)*100;
subplot(1,2,2)
Y = [male_spam_percentage; female_spam_percentage];
bar(Y,0.5);
str = {'male','female'};
ylabel('Normalized Count [%]');
title('Spam Users Percentages')
set(gca,'XTickLabel',str);

users_by_gender = [sum(Gender == 1),sum(Gender == 0)];
spam_users_by_gender = [sum(male_spam),sum(female_spam)];

subplot(1,2,1)
W1 = 0.25;
bar(users_by_gender,W1,'FaceColor',[0.2 0.2 0.5],'EdgeColor',[1 0 1]);
hold on;
W2 = 0.2;
bar(spam_users_by_gender,W2,'FaceColor',[0 0.7 0.7]);
str = {'male','female'};
set(gca,'XTickLabel',str);
legend('total users','spam users','Location','NorthWest')
ylabel('User Numbers');
title('Total/Spam User Numbers');

saveas(gcf,'spam_vs_gender','jpeg');
%% Correlation between vip users and spam 
total_spam = sum(spam==1);
non_vip_spam = sum(spam(Vip_valid == 0 & Svip_valid == 0));
non_vip_numbers = sum(Vip_valid == 0 & Svip_valid == 0);
Vip_spam = sum(spam(Vip_valid == 1));
Vip_numbers = sum(Vip_valid == 1);
Svip_spam = sum(spam(Svip_valid == 1));
Svip_numbers = sum(Svip_valid == 1);

non_vip_spam_percentage = non_vip_spam/non_vip_numbers;
Vip_spam_percentage = Vip_spam/Vip_numbers;
Svip_spam_percentage = Svip_spam/Svip_numbers;

Y = [non_vip_spam_percentage*100;Vip_spam_percentage*100;Svip_spam_percentage*100];
figure;
bar(Y,0.6);
str = {'non vip users','vip users','svip users'};
ylabel('Normalized count[%]')
title('Spam User Percentage Among Different User Types')
set(gca,'XTickLabel',str)
saveas(gcf,'Spam_user_percentage_among_different_user_types','jpeg')


figure;
bar([non_vip_numbers,Vip_numbers,Svip_numbers]);
str = {'non vip users','vip users','svip users'};
set(gca,'XTickLabel',str);
title('Different User Types Numbers')
saveas(gcf,'different_user_types_numbers','jpeg')

%% Correlation between spam/non spam users and feed counts

zero_feed_users = feed_count(feed_count == 0);
zero_spam = spam(feed_count == 0);
non_zero_feed_users = feed_count(feed_count ~= 0);
non_zero_spam = spam(feed_count ~= 0);
spam_user_non_zero_feed_counts = non_zero_feed_users(non_zero_spam == 0);
subplot(1,2,1)
hist(spam_user_non_zero_feed_counts,50);
xlabel('feed counts')
ylabel('number of users')
avg_spam_user_feed_counts = mean(spam_user_feed_counts);
title('Feed Counts of Spam Users')

subplot(1,2,2)
non_spam_user_non_zero_feed_counts = non_zero_feed_users(non_zero_spam == 1);
hist(non_spam_user_non_zero_feed_counts,50);
xlabel('feed counts')
ylabel('number of users')
avg_non_spam_user_feed_counts = mean(non_spam_user_feed_counts);
title('Feed Counts of Non-Spam Users')
suptitle('Histogram of Non-zero Feed Counts')
saveas(gcf,'histogram_of_non_zero_feed_users','jpeg')

spam_user_zero_feed_counts = length(zero_feed_users(zero_spam == 1));
spam_user_zero_feed_percentage = spam_user_zero_feed_counts/length(feed_count(spam == 1));
non_spam_user_zero_feed_counts = length(zero_feed_users(zero_spam == 0));
non_spam_user_zero_feed_percentage = non_spam_user_zero_feed_counts/length(feed_count(spam == 0));

figure;
pie([spam_user_zero_feed_counts,non_spam_user_zero_feed_counts]);
legend({'Spam Users','Non Spam Users'},'Location','NorthWest');
title('Zero-feed Users among Different User Types (Spam/Non-spam)')
saveas(gcf,'zero_feed_users_among_different_user_types','jpeg')


figure;
bar([spam_user_zero_feed_percentage*100,non_spam_user_zero_feed_percentage*100],0.4);
str = {'Spam Users','Non-spam Users'};
set(gca,'XTickLabel',str);
title('Different User Types Zero-feed Percentages')
ylabel('Normalized count[%]')
saveas(gcf,'different_user_types_zero_feed_percentage','jpeg')


%% Comment Analysis
% First to show correlation between spam and comments
spam_indeg = indeg(spam == 1);
spam_outdeg = outdeg(spam == 1);
non_spam_indeg = indeg(spam == 0);
non_spam_outdeg = outdeg(spam == 0);


subplot(2,2,1);
hist(spam_indeg,50);
title('Spam User Comments Received')
subplot(2,2,2);
hist(spam_outdeg,50);
title('Spam User Comments Given')
axis([0,800,-inf,inf])
subplot(2,2,3);
hist(non_spam_indeg,50);
title('Non-spam User Comments Received')
subplot(2,2,4);
hist(non_spam_outdeg,50);
title('Non-spam User Comments Received')
axis([0,800,-inf,+inf])
suptitle('Comments Received/Given by Spam/Non-spam Users');
saveas(gcf,'comments_received_or_given_by_spam_nonspam_users','jpeg')

avg_spam_indeg = mean(spam_indeg);
avg_spam_outdeg = mean(spam_outdeg);
avg_non_spam_indeg = mean(non_spam_indeg);
avg_non_spam_outdeg = mean(non_spam_outdeg);

figure;
indeg_outdeg = [avg_spam_indeg,avg_spam_outdeg;avg_non_spam_indeg,avg_non_spam_outdeg];
bar(indeg_outdeg)
legend('comments received','comments given','NorthWest')
str = {'Spam Users','Non-spam Users'};
set(gca,'XTickLabel',str);
title('Average Comment Received/Given by Spam/Non-spam Users')
saveas(gcf,'average_comments_received_or_given_by_spam_or_nonspam_users','jpeg')


% Second show relationship between comments and genders.
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
title('Average Comments Received/Given by Different Genders')
set(gca,'XTickLabel',str);
saveas(gcf,'comments_by_gender','jpeg');

%% Correlation between spam and collections
spam_book = book_count(spam == 1);
spam_music = music_count(spam == 1);
spam_movie = movie_count(spam == 1);

non_spam_book = book_count(spam == 0);
non_spam_music = music_count(spam == 0);
non_spam_movie = movie_count(spam == 0);

figure;
h1 = histogram(spam_book);
hold on;
h2 = histogram(non_spam_book);
h1.Normalization = 'probability';
h1.BinWidth = 0.5;
h2.Normalization = 'probability';
h2.BinWidth = 0.5;
ylabel('Normalized Probability');
axis([-1,12,-inf,+inf])
legend({'spam users','non-spam users'})
title('Book Collection by Spam/Non-spam Users')
saveas(gcf,'book_collection_among_spam_nonspam_users','jpeg');

figure;
h3 = histogram(spam_music);
hold on;
h4 = histogram(non_spam_music);
h3.Normalization = 'probability';
h3.BinWidth = 0.5;
h4.Normalization = 'probability';
h4.BinWidth = 0.5;
ylabel('Normalized probability');
axis([-1,25,-inf,+inf]);
legend({'spam users','non-spam users'})
title('Music Collection by Spam/Non-spam Users')
saveas(gcf,'music_collection_among_spam_nonspam_users','jpeg');

figure;
h5 = histogram(spam_movie);
hold on;
h6 = histogram(non_spam_movie);

h5.Normalization = 'probability';
h5.BinWidth = 0.5;
h6.Normalization = 'probability';
h6.BinWidth = 0.5;
ylabel('Normalized probability');
axis([-1,20,-inf,inf]);
legend({'spam users','non-spam users'})
title('Movie Collection by Spam/Non-spam Users')
saveas(gcf,'movie_collection_among_spam_nonspam_users','jpeg');
