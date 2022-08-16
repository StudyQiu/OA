package com.oasys.mapper;

import com.oasys.entity.ImgPath;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ImgPathMapper {

    /**
     * 修改
     * @param eid
     * @param imgPath
     * @return
     */
    boolean updImgPath(@Param("eid") Integer eid,@Param("imgPath") String imgPath);

    /**
     * 查询图片路径
     * @param eid
     * @return
     */

    ImgPath queryById(@Param("eid") Integer eid);
}
