function re_imdb = balanceImdb_plus(imdb, rate_fg)

if nargin == 1
    rate_fg = 0.05;
end

imdb_rate = (imdb.images.labels == 255)/(max(size(imdb.images.labels)));


global g_imdb_start;

if isempty(g_imdb_start) == 1
    re_imdb = imdb;

    disp('in balanceImdb_bySrc: the g_imdb_start is empty')
else
    if imdb_rate > rate_fg
        re_imdb = imdb;

        disp('in balanceImdb_bySrc: re_imdb = imdb;');
    else
%        rate_fg = 0.1;
        rate_bk = 1 - rate_fg;

        srcimdb = g_imdb_start;
        
        [srcimdb_fg srcimdb_bk] = divideFgBkImdb(srcimdb);
        [curimdb_fg curimdb_bk] = divideFgBkImdb(imdb);

        curnum_fg = max(size(curimdb_fg.images.labels))
        curnum_bk = max(size(curimdb_bk.images.labels))

        srcnum_fg = max(size(srcimdb_fg.images.labels))
        srcnum_bk = max(size(srcimdb_bk.images.labels))

        curnum_wt = round(((curnum_bk + srcnum_bk)/rate_bk) * rate_fg)
%        curnum_wt = curnum_wt - curnum_fg
        
%        eximdb_fg = extendImdb(srcimdb_fg, round(curnum_wt/2));
        eximdb_fg = extendImdb(srcimdb_fg, curnum_wt);
%        excurimdb_fg = extendImdb(curimdb_fg, round(curnum_wt/2));
        excurimdb_fg = curimdb_fg;

        
        re_imdb = mixImdb(eximdb_fg, excurimdb_fg, srcimdb_bk, curimdb_bk);

        disp('in balanceImdb_bySrc: the re_imdb is balanced')


%         global g_eximdb_fg g_curimdb_fg g_curimdb_bk g_re_imdb
% 
%         g_eximdb_fg = eximdb_fg;
%         g_curimdb_fg = curimdb_fg;
%         g_curimdb_bk = curimdb_bk;
%         g_re_imdb = re_imdb;
% 
% 
% 
%         input('pause')

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

