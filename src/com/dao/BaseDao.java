package com.dao;

import java.util.List;

public interface BaseDao {
    void executeUpdate(String sql, Object... params);

    boolean executeQueryOneUser(String sql, Object... params);

    int executeUpdateWithGeneratedKeys(String sql, Object... params);

    <T> List<T> executeQuery(String sql, RowMapper<T> rowMapper, Object... params);

    <T> T executeQueryOne(String sql, RowMapper<T> rowMapper, Object... params);
}
