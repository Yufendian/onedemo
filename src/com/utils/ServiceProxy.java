package com.utils;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public class ServiceProxy<T> implements InvocationHandler {

    private T trueObj;

    @SuppressWarnings("unchecked")
    public T createProxy(T trueObj) {
        this.trueObj = trueObj;
        return (T) Proxy.newProxyInstance(trueObj.getClass().getClassLoader(), trueObj.getClass().getInterfaces(),
                this);
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {

        try {
            JdbcUtils.startTransaction();
            Object obj = method.invoke(trueObj, args);
            //
            JdbcUtils.endTransaction();
            return obj;
        } catch (Exception e) {
            JdbcUtils.rollback();
            throw e;
        } finally {
            JdbcUtils.close();
        }
    }
}
