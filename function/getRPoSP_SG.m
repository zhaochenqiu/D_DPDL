function re_imdb = getRPoSP_SG(im_pa, im_ft, gt_pa, gt_ft, curindex, num, mode, flag)

if nargin == 1
    flag == 'get';
end

if nargin == 6
    mode = 'test';
end


global m_getRPoSP_SG_im_pa;
global m_getRPoSP_SG_im_ft;
global m_getRPoSP_SG_gt_pa;
global m_getRPoSP_SG_gt_ft;
global m_getRPoSP_SG_curindex;
global m_getRPoSP_SG_num;
global m_getRPoSP_SG_mode;


if flag == 'set'
    re_imdb = [];
    m_getRPoSP_SG_im_pa    = im_pa;
    m_getRPoSP_SG_im_ft    = im_ft;
    m_getRPoSP_SG_gt_pa    = gt_pa;
    m_getRPoSP_SG_gt_ft    = gt_ft;
    m_getRPoSP_SG_curindex = curindex;
    m_getRPoSP_SG_num      = num;
    m_getRPoSP_SG_mode     = mode;
else
    im_pa      = m_getRPoSP_SG_im_pa;
    im_ft      = m_getRPoSP_SG_im_ft;
    gt_pa      = m_getRPoSP_SG_gt_pa;
    gt_ft      = m_getRPoSP_SG_gt_ft;
    curindex   = m_getRPoSP_SG_curindex;
    num        = m_getRPoSP_SG_num;
    mode       = m_getRPoSP_SG_mode;

    re_imdb = getRPoSP(im_pa, im_ft, gt_pa, gt_ft, curindex, num, mode);
end

