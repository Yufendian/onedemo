package com.service;

import com.pojo.Employees;

import java.util.List;

public interface EmpService {

    int insert(Employees emp);

    List<Employees> selectAll();

    Employees selectone(int empid, String name);

    boolean selectOneUser(int empid, String name);
}
