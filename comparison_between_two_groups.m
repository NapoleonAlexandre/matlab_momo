%% Spam users from training set
load('final_spam_users_ver1.mat');
spam_comments_from_training_set = [average_female_indeg,average_female_outdeg,average_male_indeg,average_male_outdeg];
spam_book_mean_from_training_set = [book_mean_11to20,book_mean_21to30,book_mean_31to40,book_mean_over40];
spam_movie_mean_from_training_set = [movie_mean_11to20,movie_mean_21to30,movie_mean_31to40,movie_mean_over40];
spam_music_mean_from_training_set = [music_mean_11to20,music_mean_21to30,music_mean_31to40,music_mean_over40];
spam_user_count_all_from_training_set = user_count_all;
save('comparison_ver1.mat','spam_comments_from_training_set','spam_book_mean_from_training_set','spam_movie_mean_from_training_set','spam_music_mean_from_training_set','spam_user_count_all_from_training_set')

clear all;

%% Spam users from test set
load('final_spam_users_test_ver1');
spam_comments_from_test_set = [average_female_indeg,average_female_outdeg,average_male_indeg,average_male_outdeg];
spam_book_mean_from_test_set = [book_mean_11to20,book_mean_21to30,book_mean_31to40,book_mean_over40];
spam_movie_mean_from_test_set = [movie_mean_11to20,movie_mean_21to30,movie_mean_31to40,movie_mean_over40];
spam_music_mean_from_test_set = [music_mean_11to20,music_mean_21to30,music_mean_31to40,music_mean_over40];
spam_user_count_all_from_test_set = user_count_all;
save('comparison_ver1.mat','spam_comments_from_test_set','spam_book_mean_from_test_set','spam_movie_mean_from_test_set','spam_music_mean_from_test_set','spam_user_count_all_from_test_set','-append')

clear all;

%% Refurbished users from training set
load('final_refurbished_training_ver1.mat')
refurbished_comments_from_training_set = [average_female_indeg,average_female_outdeg,average_male_indeg,average_male_outdeg];
refurbished_book_mean_from_training_set = [book_mean_11to20,book_mean_21to30,book_mean_31to40,book_mean_over40];
refurbished_movie_mean_from_training_set = [movie_mean_11to20,movie_mean_21to30,movie_mean_31to40,movie_mean_over40];
refurbished_music_mean_from_training_set = [music_mean_11to20,music_mean_21to30,music_mean_31to40,music_mean_over40];
refurbished_user_count_all_from_training_set = user_count_all;
save('comparison_ver1.mat','refurbished_comments_from_training_set','refurbished_book_mean_from_training_set','refurbished_movie_mean_from_training_set','refurbished_music_mean_from_training_set','refurbished_user_count_all_from_training_set','-append')

clear all;

%% Refurbished users from test set
load('final_refurbished_test_ver1.mat')
refurbished_comments_from_test_set = [average_female_indeg,average_female_outdeg,average_male_indeg,average_male_outdeg];
refurbished_book_mean_from_test_set = [book_mean_11to20,book_mean_21to30,book_mean_31to40,book_mean_over40];
refurbished_movie_mean_from_test_set = [movie_mean_11to20,movie_mean_21to30,movie_mean_31to40,movie_mean_over40];
refurbished_music_mean_from_test_set = [music_mean_11to20,music_mean_21to30,music_mean_31to40,music_mean_over40];
refurbished_user_count_all_from_test_set = user_count_all;
save('comparison_ver1.mat','refurbished_comments_from_test_set','refurbished_book_mean_from_test_set','refurbished_movie_mean_from_test_set','refurbished_music_mean_from_test_set','refurbished_user_count_all_from_test_set','-append')

clear all;


%% Data analysis from previous saving data
