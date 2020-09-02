package com.service;

import com.utils.ServiceProxy;

public class ServiceFactory {
    public static EmpService getEmpService() {
        return new ServiceProxy<EmpService>().createProxy(new EmpServiceImpl());
    }
}
