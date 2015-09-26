%% Function to convert a Face_SDK feature vector into a unique hash
% Assume vector has 66 [x,y] pairs in format %4.0f
maxframe = 10000;
maxnum = maxframe.*10;
features = randi(maxframe,66,2);

%% Hash Features
hashedFeatures = round((sin(2.*pi.*(mod(features+48617,maxnum)./maxnum)) + 1).*maxnum.*1000);
hashedFeatures = dec2hex(hashedFeatures);
% 
% [r, p] = (corr(hashedFeatures,features));
% figure;scatter(hashedFeatures(:,1),features(:,1));

% Convert coordinates into single string using a 'Format' command - 9digits
% per coordinate code
strFeature = sprintf('%05c',hashedFeatures');
