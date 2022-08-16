package com.oasys.service.impl;

import com.oasys.entity.Employee;
import com.oasys.mapper.EmployeeMapper;
import com.oasys.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    private EmployeeMapper employeeMapper;

    @Override
    public List<Employee> selectAll() {
        return employeeMapper.selectAll();
    }

    @Override
    public List<Employee> login(String ename) {
        return employeeMapper.login(ename);
    }

    @Override
    public List<Employee> isLogin(String ename, String epass) {
        return employeeMapper.isLogin(ename, epass);
    }

    @Override
    public List<Employee> selectEmpByPage(Integer start, Integer length, Integer estatus, String realname){
        return employeeMapper.selectEmpByPage(start,length,estatus,realname);
    }

    @Override
    public Integer selectCountByPage(Integer estatus, String realname) {
        return employeeMapper.selectCountByPage(estatus,realname);
    }

    @Override
    public void addEmp(Employee employee) {
        employeeMapper.addEmp(employee);
    }

    @Override
    public Employee selectQuery(Integer eid) {
        return employeeMapper.selectQuery(eid);
    }

    @Override
    public Integer editEmp(Employee employee) {
        return employeeMapper.editEmp(employee);
    }

    @Override
    public Boolean deleteEmp(Integer eid, Integer estatus) {
        return employeeMapper.deleteEmp(eid,estatus);
    }
}
