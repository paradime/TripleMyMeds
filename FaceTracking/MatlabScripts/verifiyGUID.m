%% Challenge to generate 100000 GUID hashes
N = 1000000;
features = zeros(66, 2, N);
hashed = cell(N,1);
hashed(:) = '';

maxframe = 10000;
maxnum = maxframe.*10;
% features = randi(maxframe,66,2);

for i = 1:N
    % Randomly generate a new feature vector
    features(:,:, i) = randi(maxframe,66,2);
    
    % Create numerical hash for each feature
%     clear newhash;
    newhash = round((sin(2.*pi.*(mod(features(:,:,i)+48617,maxnum)./maxnum)) + 1).*maxnum.*1000);
    newhash = dec2hex(newhash);
    
    % Concatonate hashed features into string bits
    newhashStr = sprintf('%09d',newhash');
    
    % If hashed string is unique, add it to the database
    if(~checkGUID(hashed, newhashStr))
        hashed = addGUID(hashed, newhashStr);
    end
    if(mod(i,1000))
        disp(i)
    end
end
    
%% Test - if the 'hashed' list length = N, we have a winner :)
disp(N == length(hashed))