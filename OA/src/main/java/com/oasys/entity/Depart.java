package com.oasys.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class Depart {
    private Integer did;
    private String dname;
    private String duty;
    private Date credate;
    private Integer dstatus;
}
