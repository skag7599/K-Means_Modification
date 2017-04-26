function cent = kfind(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

for i=1:K
count(i)=0;

size(X);
for i=1:size(X,1)
 x=X(i,:);
 size(x);
 size(centroids);
 j=1;
 dis=(x-centroids(j,:));
 size(dis);
 dis=dis.*dis;
 ans=1;
 for j=2:size(centroids)
 n_dis=(x-centroids(j,:));
 n_dis=n_dis.*n_dis;
 if(n_dis<dis)
 n_dis=dis;
 ans=j;
 end;
 end;
 count(ans)++;
 idx(i)=ans;
end;

for i=1:length(X)
    distance = inf;
    for j=1:K
        kDist = norm(X(i, :) - centroids(j, :));
        if (kDist < distance)
            distance = kDist;
            idx(i) = j;
        end
    end
end

 

j=1;
for i=2:K
if(count(i)<count(j))
j=i;
end;
end;
xx=0;
for i=1:K
if(i!=j)
cent(xx++)=centroids(i)
end;
end;

% =============================================================

end

