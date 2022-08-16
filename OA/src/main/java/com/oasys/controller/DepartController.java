package com.oasys.controller;

import com.oasys.entity.Depart;
import com.oasys.entity.Employee;
import com.oasys.service.DepartService;
import com.oasys.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/emp")
public class DepartController {
    @Autowired
    private DepartService departService;
    @Autowired
    private EmployeeService employeeService;

    /**
     * 根据部门状态查询部门信息
     * @return
     */
    @RequestMapping("/toEmpAdd")
    public ModelAndView toEmpAdd(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("addEmp");
        mv.addObject("dept",departService.selectAllDepart(0));
        return mv;
    }

    /**
     * 新增员工信息
     * @param employee
     * @return
     */
    @RequestMapping("/addEmp")
    public String addEmp(Employee employee){
        employeeService.addEmp(employee);
        return "redirect:/employ/toEmpPage?page=1&length=4&estatus=0";
    }

    /**
     * 根据部门状态查询部门信息
     * @param dstatus
     * @return
     */
    @RequestMapping("/selectAllDepart")
    public ModelAndView selectAllDepart(int dstatus){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("dept");
        mv.addObject("dept",departService.selectAllDepart(dstatus));
        return mv;
    }

    /**
     * 删除恢复部门
     * @param did
     * @param dstatus
     * @return
     */
    @RequestMapping("/deleteDepart")
    public String deleteDepart(int did,int dstatus){
        departService.deleteDepart(did,dstatus);
        return "redirect:/emp/selectAllDepart?dstatus="+dstatus;
    }

    /**
     * 查询部门表部门id
     * @param did
     * @return
     */
    @RequestMapping("/selectDeptDid")
    public ModelAndView selectDeptDid(int did){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("editDept");
        mv.addObject("dept",departService.selectDeptDid(did));
        return mv;
    }

    /**
     * 修改部门信息
     * @param depart
     * @return
     */
    @RequestMapping("/editDept")
    public String editDept(Depart depart){
        departService.editDept(depart);
        return "redirect:/emp/selectAllDepart?dstatus="+depart.getDstatus();
    }

    /**
     * 跳转页面
     * @return
     */
    @RequestMapping("/addDepart")
    public String addDepart(){
        return "addDept";
    }

    /**
     * 添加部门信息
     * @param depart
     * @return
     */
    @RequestMapping("/addDept")
    public String addDept(Depart depart){
        departService.addDept(depart);
        return "redirect:/emp/selectAllDepart?dstatus=0";
    }
}
