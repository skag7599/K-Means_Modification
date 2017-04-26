function topn_k=findoutliers(X,centroids,idx)


dis=zeros(size(X,1));
K=zeros(size(centroids,1));
n=zeros(size(centroids,1));
for i=1:size(X,1)
 x=X(i,:);
 d=centroids(idx(i),:);
 dis=x-d;
 dis=dis*dis';
 size(dis);
 K(idx(i))=K(idx(i))+dis;
 n(idx(i))=n(idx(i))+1;
end;

for i=1:size(centroids,1)
 K(i)=K(i)/n(i);
 fprintf(' %d ', K(i));
 fprintf(' %d \n', n(i));
end;



out=zeros(size(X,1));

for i=1:size(X,1)
 x=X(i,:);
 d=centroids(idx(i),:);
 dis=x-d;
 dis=dis*dis';
 if(K(idx)<dis)
 out(i)=dis;
 end;
end;

out=sort(out);
index=zeros(size(X,1));

for i=1:size(X,1)
 index(i)=i;
end;

for i=1:size(X,1)
 for j=i+1:size(X,1)
  if(out(i)<out(j))
   temp=out(i);
   out(i)=out(j);
   out(j)=temp;
   temp=index(i);
   index(i)=index(j);
   index(j)=temp;
  end;
 end;
end; 


for i=1:size(X,1)
 if(out(i)!=0)
 fprintf(' value %d index %d \n', out(i),index(i));
 end;
end;