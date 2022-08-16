package com.oasys.mapper;

import com.oasys.entity.Depart;
import com.oasys.entity.Employee;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DepartMapper {
    /**
     * 根据部门状态查询部门信息
     */
    List<Depart> selectAllDepart(Integer dstatus);

    /**
     * 查询部门表部门id
     * @param did
     * @return
     */
    Depart selectDeptDid(@Param("did") Integer did);

    /**
     *删除恢复部门
     * @param did
     * @param dstatus
     * @return
     */
    Boolean deleteDepart(@Param("did") Integer did, @Param("dstatus") Integer dstatus);

    /**
     * 修改部门信息
     * @return
     */
    Integer editDept(Depart depart);

    /**
     * 添加部门信息
     * @param depart
     */
    void addDept(Depart depart);
}
