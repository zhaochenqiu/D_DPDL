function re_imdb = balanceImdb_plus(imdb, rate_fg)

if nargin == 1
    rate_fg = 0.1;
end

imdb_rate = (imdb.images.labels == 255)/(max(size(imdb.images.labels)));

if imdb_rate > rate_fg
    re_imdb = imdb;
else
    rate_bk = 1 - rate_fg;

    [imdb_fg imdb_bk] = divideFgBkImdb(imdb);

    num_fg = max(size(imdb_fg.images.labels));
    num_bk = max(size(imdb_bk.images.labels));

    num_wt = round((num_bk / rate_bk) * rate_fg);

    if num_wt < num_fg
        re_imdb = mixImdb(imdb_fg, imdb_bk);
    else
        eximdb_fg = extendImdb(imdb_fg, num_wt);

        re_imdb = mixImdb(eximdb_fg, imdb_bk);
    end
end



