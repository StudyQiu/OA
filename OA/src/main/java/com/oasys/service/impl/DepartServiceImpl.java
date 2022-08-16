package com.oasys.service.impl;

import com.oasys.entity.Depart;
import com.oasys.entity.Employee;
import com.oasys.mapper.DepartMapper;
import com.oasys.service.DepartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartServiceImpl implements DepartService {
    @Autowired
    private DepartMapper departMapper;

    @Override
    public List<Depart> selectAllDepart(Integer dstatus){
        return departMapper.selectAllDepart(dstatus);
    }

    @Override
    public Depart selectDeptDid(Integer did) {
        return departMapper.selectDeptDid(did);
    }

    @Override
    public Boolean deleteDepart(Integer did, Integer dstatus) {
        return departMapper.deleteDepart(did,dstatus);
    }

    @Override
    public Integer editDept(Depart depart) {
        return departMapper.editDept(depart);
    }

    @Override
    public void addDept(Depart depart) {
        departMapper.addDept(depart);
    }

}
