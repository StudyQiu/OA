package com.oasys.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class Note {
    /**
     * 请假id
     */
    private Integer nid;
    /**
     * 请假标题
     */
    private String title;
    /**
     * 请假原因
     */
    private String context;
    /**
     * 请假开始时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startdate;
    /**
     * 请假结束时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date enddate;
    /**
     * 请假时长
     */
    private Float length;
    /**
     * 请假提交时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date subdate;
    /**
     * 请假审批状态
     */
    private Integer estatus;
    /**
     * 请假审批时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date reldate;
    /**
     * 请假员工id
     */
    private Integer eid;
}
