function res = derivative1D(list, delta)

if nargin == 1
    delta = 1;
end

len = max(size(list));
res = list;

for i = 1 + delta:len
    res(i) = list(i) - list(i - delta);
end

res(1:1 + delta) = 0;
