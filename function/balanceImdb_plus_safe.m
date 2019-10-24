function re_imdb = balanceImdb_plus(imdb, rate_fg)

if nargin == 1
    rate_fg = 0.2;
end

imdb_rate = (imdb.images.labels == 255)/(max(size(imdb.images.labels)));


global g_imdb_start;

if isempty(g_imdb_start) == 1
    re_imdb = imdb;

else
    if imdb_rate > rate_fg
        re_imdb = imdb;

    else
        rate_bk = 1 - rate_fg;

        srcimdb = g_imdb_start;
        
        [srcimdb_fg srcimdb_bk] = divideFgBkImdb(srcimdb);
        [curimdb_fg curimdb_bk] = divideFgBkImdb(imdb);

        curnum_fg = max(size(curimdb_fg.images.labels));
        curnum_bk = max(size(curimdb_bk.images.labels));

        srcnum_fg = max(size(srcimdb_fg.images.labels));
        srcnum_bk = max(size(srcimdb_bk.images.labels));

        curnum_wt = round((curnum_bk/rate_bk) * rate_fg);
        curnum_wt = curnum_wt - curnum_fg;
        
        eximdb_fg = extendImdb(srcimdb_fg, round(curnum_wt/2));
        
        re_imdb = mixImdb(eximdb_fg, curimdb_fg, curimdb_bk);

    end
end


% imdb_rate = (imdb.images.labels == 255)/(max(size(imdb.images.labels)));
% 
% if imdb_rate > rate_fg
%     re_imdb = imdb;
% else
%     rate_bk = 1 - rate_fg;
% 
%     [imdb_fg imdb_bk] = divideFgBkImdb(imdb);
% 
%     num_fg = max(size(imdb_fg.images.labels));
%     num_bk = max(size(imdb_bk.images.labels));
% 
%     num_wt = round((num_bk / rate_bk) * rate_fg);
% 
%     if num_wt < num_fg
%         re_imdb = mixImdb(imdb_fg, imdb_bk);
%     else
%         eximdb_fg = extendImdb(imdb_fg, num_wt);
% 
%         re_imdb = mixImdb(eximdb_fg, imdb_bk);
%     end
% end
% 
% 

