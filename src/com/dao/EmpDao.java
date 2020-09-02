package com.dao;

import com.pojo.Employees;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class EmpDao {
    private JdbcTemplate jdbcTemplate = new JdbcTemplate();

    // 添加数据
    public int insert(Employees emp) {
        String sql = "insert into Employees(username,password,tel,name,email,emptype) values(?,?,?,?,?,?)";
        return jdbcTemplate.executeUpdateWithGeneratedKeys(sql, emp.getUsername(), emp.getPassword(), emp.getTel(), emp.getName(), emp.getEmail(), emp.getEmptype());
    }

    // 查询表中所有的数据
    public List<Employees> selectAll() {
        String sql = "select empid,username,password,tel,name,email,emptype from employees";
        return jdbcTemplate.executeQuery(sql, new EmployeesRowMapper());
    }

    public Employees selectone(int empid, String name) {
        String sql = "select empid,username,password,tel,name,email,emptype from employees where empid = ? and name = ?";
        return jdbcTemplate.executeQueryOne(sql, new EmployeesRowMapper(), empid, name);
    }

    public boolean selectOneUser(int empid, String name) {
        String sql = "select empid,username,password,tel,name,email,emptype from employees where empid = ? and name = ?";
        return jdbcTemplate.executeQueryOneUser(sql, empid, name);
    }

    class EmployeesRowMapper implements RowMapper<Employees> {

        @Override
        public Employees mapRow(ResultSet rs) throws SQLException {
            Employees employees = new Employees();
            employees.setEmpid(rs.getInt(1));
            employees.setUsername(rs.getString(2));
            employees.setPassword(rs.getString(3));
            employees.setTel(rs.getString(4));
            employees.setName(rs.getString(5));
            employees.setEmail(rs.getString(6));
            employees.setEmptype(rs.getString(7));
            return employees;
        }

    }


}
