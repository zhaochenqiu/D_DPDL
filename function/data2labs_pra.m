function labs = data2labs_pra(data)

data = squeeze(data);

[row column] = size(data);

% labs = zeros(1,column) + 1;
labs = zeros(2, column);

labs(1, :) = data(1, :);
labs(2, :) = data(255, :);

% labs = data(255,:) - data(1, :);


%index = data(255,:) > data(1,:);
%labs(index) = 255;

%{
for i = 1:column
    pos = find(max(data(:,i)) == data(:,i));
    labs(i) = pos(1);
end
%}
