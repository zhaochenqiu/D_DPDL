function re_str = extractPathName(im_pa)

list = find(im_pa == '/');
pos = [list(end - 3) list(end - 1)];
mid = list(end - 2);

im_pa(mid) = '_';
re_str = im_pa(pos(1) + 1:pos(2) - 1);

