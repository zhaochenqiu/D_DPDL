function re_imdb = softImdb(imdb)


% data = imdb.images.data;
% data = abs(data);
% idx = data > 100;
% data(idx) = 100;
% imdb.images.data = data;

% maxvalue = max(max(max(max(abs(imdb.images.data)))));

imdb.images.data = (abs(imdb.images.data) ./ 255)*(pi);
imdb.images.data = cos(imdb.images.data);

re_imdb = imdb;





% imdb.images.data = sigmf(imdb.images.data ./ 150, [2 0]);
% re_imdb = imdb;








% meanvalue = mean(mean(mean(mean(abs(imdb.images.data)))));
% imdb.images.data = normpdf(abs(imdb.images.data), meanvalue, 15);
% re_imdb = imdb;


% imdb.images.data = normpdf(abs(imdb.images.data), meanvalue, 15);
%imdb.images.data = tanh(abs(imdb.images.data) ./ 255);
%re_imdb = imdb;




