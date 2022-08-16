package com.oasys.service;

import com.oasys.entity.Employee;

import java.util.List;

public interface EmployeeService {
    /**
     *查询所有员工
     */
    List<Employee> selectAll();

    /**
     *判断用户是否登录成功
     * @return
     */
    List<Employee> login(String ename);

    List<Employee> isLogin(String ename,String epass);

    /**
     * 分页查询用户信息
     */
    List<Employee> selectEmpByPage(Integer start,Integer length,Integer estatus,String realname);

    /**
     * 根据状态查询员工总记录数
     * @param estatus
     * @return
     */
    Integer selectCountByPage(Integer estatus, String realname);

    /**
     * 新增员工信息
     */
    void addEmp(Employee employee);

    /**
     * 根据eid查询和修改员工信息
     * @param eid
     * @return
     */
    Employee selectQuery(Integer eid);
    Integer editEmp(Employee employee);

    /**
     * 删除恢复员工信息
     * @param eid
     * @param estatus
     * @return
     */
    Boolean deleteEmp(Integer eid, Integer estatus);

}
