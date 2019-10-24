function re_str = extractPathName_byResult(im_pa)

list = find(im_pa == '/');
pos = [list(end - 2) list(end)];
mid = list(end - 1);

im_pa(mid) = '_';
re_str = im_pa(pos(1) + 1:pos(2) - 1);

