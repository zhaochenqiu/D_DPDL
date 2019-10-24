function re_imdb = getRPoTP_SG(im_pa, im_ft, gt_pa, gt_ft, curindex, num, mode, flag)

if nargin == 1
    flag == 'get';
end

if nargin == 6
    mode = 'test';
end


global m_getRPoTP_SG_im_pa;
global m_getRPoTP_SG_im_ft;
global m_getRPoTP_SG_gt_pa;
global m_getRPoTP_SG_gt_ft;
global m_getRPoTP_SG_curindex;
global m_getRPoTP_SG_num;
global m_getRPoTP_SG_mode;


if flag == 'set'
    re_imdb = [];
    m_getRPoTP_SG_im_pa    = im_pa;
    m_getRPoTP_SG_im_ft    = im_ft;
    m_getRPoTP_SG_gt_pa    = gt_pa;
    m_getRPoTP_SG_gt_ft    = gt_ft;
    m_getRPoTP_SG_curindex = curindex;
    m_getRPoTP_SG_num      = num;
    m_getRPoTP_SG_mode     = mode;
else
    im_pa      = m_getRPoTP_SG_im_pa;
    im_ft      = m_getRPoTP_SG_im_ft;
    gt_pa      = m_getRPoTP_SG_gt_pa;
    gt_ft      = m_getRPoTP_SG_gt_ft;
    curindex   = m_getRPoTP_SG_curindex;
    num        = m_getRPoTP_SG_num;
    mode       = m_getRPoTP_SG_mode;

    re_imdb = getRPoTP(im_pa, im_ft, gt_pa, gt_ft, curindex, num, mode);
end

