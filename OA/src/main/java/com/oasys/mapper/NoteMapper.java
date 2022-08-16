package com.oasys.mapper;

import com.oasys.entity.Employee;
import com.oasys.entity.Note;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NoteMapper {

    /**
     * 查询员工请假及分页
     * @param eid
     * @param start
     * @param length
     * @return
     */
    List<Note> selectNote(@Param("type") Integer type,@Param("eid") Integer eid, @Param("start") Integer start, @Param("length") Integer length);

    /**
     * 查询员工请假及分页
     * @param type
     * @param start
     * @param length
     * @return
     */
    List<Note> selectNotes(@Param("type") Integer type, @Param("start") Integer start, @Param("length") Integer length);

    /**
     * 查询员工请假数量及分页
     * @param eid
     * @param start
     * @return
     */
    Integer selectCountNote(@Param("eid") Integer eid, @Param("type") Integer start);

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
    List<Note> selectLeave(@Param("eid") Integer eid);

    /**
     * 对员工申请请假进行操作
     * @param nid
     * @param estatus
     * @return
     */
    Boolean updateNote(@Param("nid") Integer nid,@Param("estatus") Integer estatus);

    /**
     * 根据nid查找请假记录
     * @param nid
     * @return
     */
    Note selectNoteLeave(@Param("nid") Integer nid);

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
