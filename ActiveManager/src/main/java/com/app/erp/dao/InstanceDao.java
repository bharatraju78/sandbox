package com.app.erp.dao;

import java.util.List;

import com.app.erp.model.ErpInstance;

public interface InstanceDao {

	ErpInstance findById(int id);
	
	void save(ErpInstance erpInstance);
	
	void update(ErpInstance erpInstance);
	
	void deleteById(int id);
	
	List<ErpInstance> findAllInstances();
	
	ErpInstance findByName(String instanceName);
}
