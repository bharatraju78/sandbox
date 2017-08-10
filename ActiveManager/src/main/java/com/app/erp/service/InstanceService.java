/**
 * 
 */
package com.app.erp.service;

import java.util.List;

import com.app.erp.model.ErpInstance;

/**
 * @author bharat
 *
 */
public interface InstanceService {

	ErpInstance findById(int id);
	
	void save(ErpInstance erpInstance);
	
	void update(ErpInstance erpInstance);
	
	void deleteById(int id);
	
	List<ErpInstance> findAllInstances();
	
	boolean isInstanceUnique(Integer id, String instanceName);
	
}
