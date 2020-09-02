package com.test;

import com.pojo.Employees;
import com.service.EmpService;
import com.service.ServiceFactory;

import java.util.List;

public class Main {
    public static void main(String[] args) {
        Employees employees = new Employees();

        employees.setUsername("周杰伦");
        employees.setPassword("123456");
        employees.setTel("13000000000");
        employees.setName("周杰伦");
        employees.setEmail("123@xx.com");
        employees.setEmptype("歌手");

        EmpService employeesService = ServiceFactory.getEmpService();
        employeesService.insert(employees);
        List<Employees> list = employeesService.selectAll();

        for (Employees e:list) {
            System.out.println(e);
        }

    }
}
