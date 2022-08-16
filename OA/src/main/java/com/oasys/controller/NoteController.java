package com.oasys.controller;

import com.oasys.entity.Depart;
import com.oasys.entity.Employee;
import com.oasys.entity.Note;
import com.oasys.service.EmployeeService;
import com.oasys.service.NoteService;
import com.sun.java.accessibility.util.EventID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class NoteController {
    @Autowired
    private NoteService noteService;
    @Autowired
    private EmployeeService employeeService;

    /**
     * 查询请假记录
     * @param page
     * @param length
     * @param type
     * @param eid
     * @return
     */
    @RequestMapping("/selectNote")
    public ModelAndView selectNote(Integer page, Integer length, Integer type, Integer eid){
        ModelAndView mv = new ModelAndView();
        List<Note> notes = null;
        Integer totalLine = null;
        Map<Integer,String> map = new HashMap<>();
        //根据eid获取did进行判断
        Employee employee = employeeService.selectQuery(eid);
        if (employee.getDid() != 1 && employee.getDid() != 2){
            //获取分页后的员工请假数据
            totalLine = noteService.selectCountNote(eid,type);
            //获取员工请假记录
            notes = noteService.selectNote(type,eid,(page - 1) * length,length);
        }else{
            //获取分页后的员工请假数据
            totalLine = noteService.selectCountNote(null,type);
            //获取员工请假记录
            notes = noteService.selectNotes(type,(page - 1) * length,length);
        }
        if(notes.size()>0){
            for(Note note : notes){
                map.put(note.getEid(),employeeService.selectQuery(note.getEid()).getRealname());
            }
        }
        //获取分页数量
        Integer totalPage = totalLine % length == 0 ? totalLine / length : totalLine / length + 1;
        mv.setViewName("leave");
        if (map!=null){
            mv.addObject("employees",map);
        }
        mv.addObject("totalLine",totalLine);
        mv.addObject("totalPage",totalPage);
        mv.addObject("note",notes);
        mv.addObject("type",type);
        mv.addObject("page",page);
        return mv;
    }

    /**
     * 跳转页面
     * @return
     */
    @RequestMapping("/addLeave")
    public String addLeave(){
        return "addLeave";
    }

    /**
     * 添加请假记录
     * @param note
     * @return
     */
    @RequestMapping("/addNote")
    public String addNote(Note note){
        //申请请假
        noteService.addNote(note);
        return "redirect:/selectNote?page=1&length=4&type=0&eid=" + note.getEid();
    }

    /**
     * 对请假信息进行操作
     * @param nid
     * @param estatus
     * @param eid
     * @return
     */
    @RequestMapping("/updateNote")
    public ModelAndView updateNote(Integer nid,Integer estatus,Integer eid){
        ModelAndView mv = new ModelAndView();
        //根据eid查询信息
        List<Note> list = noteService.selectLeave(eid);
        //根据nid修改状态
        boolean note = noteService.updateNote(nid, estatus);
        mv.setViewName("redirect:/selectNote?page=1&length=4&type=0&eid="+eid);
        mv.addObject("note",note);
        mv.addObject("emp",list);
        return mv;
    }

    /**
     * 根据eid查询
     * @param eid
     * @return
     */
    @RequestMapping("/updatePwd")
    public ModelAndView updatePwd(Integer eid){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("updatePwd");
        //获取员工表信息
        Employee employee = employeeService.selectQuery(eid);
        mv.addObject("param",employee);
        return mv;
    }

    /**
     * 查询请假记录
     * @param nid
     * @return
     */
    @RequestMapping("/selectNoteLeave")
    public ModelAndView selectNoteLeave(Integer nid){
        ModelAndView mv = new ModelAndView();
        System.out.println(nid);
        //根据nid查找请假数据
        Note list = noteService.selectNoteLeave(nid);
        System.out.println(list);
        mv.setViewName("editLeave");
        mv.addObject("notes",list);
        return mv;
    }

    /**
     * 对打回的信息进行编辑
     * @param note
     * @return
     */
    @RequestMapping("/updateNoteLeave")
    public String updateNoteLeave(Note note){
        //修改打回信息
        noteService.updateNoteLeave(note);
        return "redirect:/selectNote?page=1&length=4&type=0&eid="+note.getEid();
    }

    /**
     * 修改用户密码
     * @param employee
     * @return
     */
    @RequestMapping("/updateAndLogin")
    public String updateAndLogin(Employee employee){
        //修改密码
        noteService.updateAndLogin(employee);
        return "login";
    }

}
