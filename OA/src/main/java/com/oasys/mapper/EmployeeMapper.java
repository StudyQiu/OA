package com.oasys.mapper;

import com.oasys.entity.Employee;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmployeeMapper {
    /**
     *查询所有员工
     */
    List<Employee> selectAll();

    /**
     *用户是否登录成功
     */
    List<Employee> login(String ename);

    List<Employee> isLogin(@Param("ename") String ename, @Param("epass")String epass);
    /**
     * 分页查询用户信息
     */
    List<Employee> selectEmpByPage(@Param("start") Integer start,@Param("length") Integer length,@Param("estatus") Integer estatus,@Param("realname") String realname);

    /**
     * 根据状态查询员工总记录数
     * @param estatus
     * @return
     */
    Integer selectCountByPage(@Param("estatus") Integer estatus, @Param("realname") String realname);

    /**
     * 新增员工信息
     * @param employee
     */
    void addEmp(Employee employee);

    /**
     * 根据eid查询
     * @param eid
     * @return
     */
    Employee selectQuery(@Param("eid") Integer eid);

    /**
     * 修改员工信息
     * @param
     * @return
     */
    Integer editEmp(Employee employee);

    /**
     * 删除恢复员工信息
     * @param eid
     * @param estatus
     * @return
     */
    Boolean deleteEmp(@Param("eid") Integer eid, @Param("estatus") Integer estatus);

}
