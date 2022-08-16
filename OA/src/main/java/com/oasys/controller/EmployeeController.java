package com.oasys.controller;

import com.oasys.entity.Depart;
import com.oasys.entity.Employee;
import com.oasys.entity.ImgPath;
import com.oasys.entity.Note;
import com.oasys.service.DepartService;
import com.oasys.service.EmployeeService;
import com.oasys.service.ImgPathService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

@Controller
@RequestMapping("/employ")
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private DepartService departService;
    @Autowired
    private ImgPathService imgPathService;
    @Autowired
    private HttpSession session;

    /**
     * 查询员工表全部信息
     * @return
     */
    @RequestMapping("/selectAllEmp")
    @ResponseBody
    public List<Employee> selectAllEmp(){
        return employeeService.selectAll();
    }

    /**
     * 判断用户登录账号是否正确
     * @param ename
     * @return
     */
    @RequestMapping("/login")
    @ResponseBody
    public String login(String ename){
        if (!StringUtils.isEmpty(ename.trim())) {
            List<Employee> list = employeeService.login(ename);
            return list.size() > 0 ? "true" : "false";
        }
        return "false";
    }

    /**
     * 判断用户账号密码是否符合
     * @param ename
     * @param epass
     * @return
     */
    @RequestMapping("/isLogin")
    public String isLogin(String ename, String epass){
        //获取用户名的长度
        int unameLength=ename.length();
        //获取密码的长度
        int upassLength=epass.length();
        if (unameLength>=2&&unameLength<=20&&upassLength>=2&&upassLength<=20){
            String reg = "^[A-Za-z0-9]+$";
            if (Pattern.matches(reg,ename)&&Pattern.matches(reg, epass)) {
                //登录账号信息
                List<Employee> list = employeeService.isLogin(ename, epass);
                if (list.size() > 0) {
                    Employee employee = list.get(0);
                    //根据did查询部门信息
                    Depart depart = departService.selectDeptDid(employee.getDid());
                    //根据eid查询头像
                    ImgPath imgPath = imgPathService.queryById(employee.getEid());
                    session.setAttribute("dept",depart);
                    session.setAttribute("img",imgPath);
                    session.setAttribute("emp",employee);
                    return "index";
                }
            }
        }
        return "login";
    }

    /**
     * 查询刷新员工信息
     * @param page
     * @param length
     * @param estatus
     * @param realname
     * @return
     */
    @RequestMapping("/toEmpPage")
    public ModelAndView toEmpPage(Integer page, Integer length, Integer estatus, String realname){
        ModelAndView mv = new ModelAndView();
        Map<Integer,String> map = new HashMap<>();
        //获取分页后的数据
        List<Employee> employees = employeeService.selectEmpByPage((page - 1) * length, length, estatus, realname);
        //根据状态获取员工记录
        int totalLine = employeeService.selectCountByPage(estatus, realname);
        if(employees.size()>0){
            for(Employee employee : employees){
                map.put(employee.getEid(),departService.selectDeptDid(employee.getDid()).getDname());
            }
        }
        //获取分页数量
        int totalPage = totalLine % length == 0 ? totalLine / length : totalLine / length + 1;
        mv.setViewName("emp");
        if (map!=null){
            mv.addObject("did",map);
        }
        mv.addObject("totalLine",totalLine);
        mv.addObject("totalPage",totalPage);
        mv.addObject("page",page);
        mv.addObject("length",length);
        mv.addObject("estatus",estatus);
        mv.addObject("realname",realname);
        mv.addObject("employ",employees);
        return mv;
    }

    /**
     * 根据eid和部门状态查询员工
     * @param eid
     * @return
     */
    @RequestMapping("/selectQuery")
    public ModelAndView editEmp(Integer eid){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("editEmp");
        //根据eid查询
        Employee employee = employeeService.selectQuery(eid);
        mv.addObject("editEmp",employee);
        //部门状态查询
        List<Depart> departs = departService.selectAllDepart(0);
        mv.addObject("dept",departs);
        return mv;
    }

    /**
     * 根据查询到的数据进行修改
     * @param employee
     * @return
     */
    @RequestMapping("/editEmp")
    public String editEmp(Employee employee){
        //eid查询
        Employee employee1 = employeeService.selectQuery(employee.getEid());
        session.setAttribute("emp",employee1);
        //修改员工
        employeeService.editEmp(employee);
        return "redirect:/employ/toEmpPage?page=1&length=4&estatus=0";
    }

    /**
     * 删除恢复员工信息
     * @param eid
     * @param estatus
     * @return
     */
    @RequestMapping("/deleteEmp")
    public String deleteEmp(Integer eid, Integer estatus){
        employeeService.deleteEmp(eid,estatus);
        return "redirect:/employ/toEmpPage?page=1&length=4&estatus=0";
    }


}
