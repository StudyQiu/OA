package com.oasys.service.impl;

import com.oasys.entity.ImgPath;
import com.oasys.mapper.ImgPathMapper;
import com.oasys.service.ImgPathService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ImgPathServiceImpl implements ImgPathService {
    @Autowired
    private ImgPathMapper imgPathMapper;

    @Override
    public boolean updImgPath(Integer eid, String imgPath) {
        return imgPathMapper.updImgPath(eid,imgPath);
    }

    @Override
    public ImgPath queryById(Integer eid) {
        return imgPathMapper.queryById(eid);
    }
}
