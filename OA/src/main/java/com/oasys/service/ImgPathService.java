package com.oasys.service;

import com.oasys.entity.ImgPath;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ImgPathService {

    /**
     * 修改
     * @param eid
     * @param imgPath
     * @return
     */
    boolean updImgPath(Integer eid, String imgPath);

    /**
     * 查询图片路径
     * @param eid
     * @return
     */

    ImgPath queryById(Integer eid);
}
