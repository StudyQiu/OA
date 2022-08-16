package com.oasys.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class Employee implements Serializable {
    private static final long serialVersionUID = 5966571549758724511L;
    /**
     * 员工编号
     */
    private Integer eid;
    /**
     * 员工名字
     */
    private String ename;
    /**
     * 员工密码
     */
    private String epass;
    /**
     * 真实姓名
     */
    private String realname;
    /**
     * 员工性别
     */
    private Integer esex;
    /**
     * 入职时间
     */
    private Date entrydate;
    /**
     * 离职时间
     */
    private Date leavedate;
    /**
     * 员工权限
     */
    private Integer position;
    /**
     * 员工工资
     */
    private Integer sal;
    /**
     * 员工状态
     */
    private Integer estatus;
    /**
     * 部门编号
     */
    private Integer did;
}
