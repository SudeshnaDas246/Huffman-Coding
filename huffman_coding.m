function [ steps, code ] = huffman_coding( p )

if sum(p) ~= 1
    disp('Please enter proabilites which add up to 1')
    return
end

n=length(p);
codeword=cell(1,n);
X=zeros(n,n-1);
temp=p;

steps = zeros(n,n-1);
psort = sort(p,'descend');
steps(:,1) = psort;

for ii = 2:n-1
    paddedp = zeros(1,n)
    newp = psort(end) + psort(end - 1);
    psort = sort([psort(1:end-2),newp],'descend');
    paddedp(1:length(psort)) = psort;
    steps(:,ii) = paddedp;
end

for ii=1:n-1
    [~ ,l]=sort(temp);
    X(l(1),ii)=10;
    X(l(2),ii)=11;
    temp(l(2))=temp(l(2))+temp(l(1));
    temp(l(1))=100;
end

% ii=n-1;
% rows=find(X(:,ii)==10);
% codeword(rows)=strcat(codeword(rows),'1');
% rows=find(X(:,ii)==11);
% codeword(rows)=strcat(codeword(rows),'0');
% 
% for ii=n-2:-1:1
%     row11=find(X(:,ii)==11);
%     row10=find(X(:,ii)==10);
%     codeword(row10)=strcat(codeword(row11),'1');
%     codeword(row11)=strcat(codeword(row11),'0');
% end

for ii=n-1:-1:1
    row11=find(X(:,ii)==11);
    row10=find(X(:,ii)==10);
    codeword(row10)=strcat(codeword(row11),'1');
    codeword(row11)=strcat(codeword(row11),'0');
end

code = [num2cell(p)',codeword'];

end