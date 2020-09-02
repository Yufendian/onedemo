package com.service;

import com.dao.EmpDao;
import com.pojo.Employees;

import java.util.List;

public class EmpServiceImpl implements EmpService {

    private EmpDao empDao = new EmpDao();

    @Override
    public int insert(Employees emp) {
        return empDao.insert(emp);
    }

    @Override
    public List<Employees> selectAll() {
        return empDao.selectAll();
    }

    @Override
    public Employees selectone(int empid, String name) {
        return empDao.selectone(empid, name);
    }

    @Override
    public boolean selectOneUser(int empid, String name) {
        return empDao.selectOneUser(empid, name);
    }


}
