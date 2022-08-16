package com.oasys.service.impl;

import com.oasys.entity.Employee;
import com.oasys.entity.Note;
import com.oasys.mapper.NoteMapper;
import com.oasys.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoteServiceImpl implements NoteService {
    @Autowired
    private NoteMapper noteMapper;

    @Override
    public List<Note> selectNote(Integer type,Integer eid, Integer page, Integer length) {
        return noteMapper.selectNote(type,eid,page,length);
    }

    @Override
    public List<Note> selectNotes(Integer type, Integer page, Integer length) {
        return noteMapper.selectNotes(type,page,length);
    }

    @Override
    public Integer selectCountNote(Integer eid, Integer page) {
        return noteMapper.selectCountNote(eid,page);
    }

    @Override
    public void addNote(Note note) {
        noteMapper.addNote(note);
    }

    @Override
    public List<Note> selectLeave(Integer eid) {
        return noteMapper.selectLeave(eid);
    }

    @Override
    public Boolean updateNote(Integer nid, Integer estatus) {
        return noteMapper.updateNote(nid,estatus);
    }

    @Override
    public Note selectNoteLeave(Integer nid) {
        return noteMapper.selectNoteLeave(nid);
    }

    @Override
    public Boolean updateNoteLeave(Note note) {
        return noteMapper.updateNoteLeave(note);
    }

    @Override
    public Boolean updateAndLogin(Employee employee) {
        return noteMapper.updateAndLogin(employee);
    }
}
