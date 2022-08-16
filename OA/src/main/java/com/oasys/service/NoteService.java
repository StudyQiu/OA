package com.oasys.service;

import com.oasys.entity.Employee;
import com.oasys.entity.Note;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NoteService {

    /**
     * 查询员工请假情况及分页
     * @param eid
     * @param page
     * @param length
     * @return
     */
    List<Note> selectNote(Integer type,Integer eid, Integer page, Integer length);

    /**
     * 查询员工请假情况及分页
     * @param type
     * @param page
     * @param length
     * @return
     */
    List<Note> selectNotes(Integer type, Integer page, Integer length);

    /**
     * 查询员工请假数量及分页
     * @param eid
     * @param page
     * @return
     */
    Integer selectCountNote(Integer eid,Integer page);

    /**
     * 申请请假
     * @param note
     * @return
     */
    void addNote(Note note);

    /**
     * 根据eid查找请假记录
     * @param eid
     * @return
     */
    List<Note> selectLeave(Integer eid);

    /**
     * 对员工申请请假进行操作
     * @param nid
     * @param estatus
     * @return
     */
    Boolean updateNote(Integer nid,Integer estatus);

    /**
     * 根据nid查找请假记录
     * @param nid
     * @return
     */
    Note selectNoteLeave(Integer nid);

    /**
     * 对打回的请假进行修改
     * @param note
     * @return
     */
    Boolean updateNoteLeave(Note note);

    /**
     * 修改密码
     * @param employee
     * @return
     */
    Boolean updateAndLogin(Employee employee);
}
