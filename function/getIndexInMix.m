function [re_base re_offset] = getIndexInMix(pos, imdb_sizes)

nums = max(size(imdb_sizes));

re_base = 1;
re_offset = 0;


while pos > 0
    pos = pos - imdb_sizes(re_base);

    re_base = re_base + 1;
end

re_base = re_base - 1;
re_offset = pos + imdb_sizes(re_base);
% re_base
% re_offset
