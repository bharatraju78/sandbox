/**
 * 
 */
package com.app.erp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.app.erp.dao.InstanceDao;
import com.app.erp.model.ErpInstance;

/**
 * @author bharat
 *
 */
@Service("instanceService")
@Transactional
public class InstanceServiceImpl implements InstanceService {

	@Autowired
	private InstanceDao dao;
	
	@Override
	public ErpInstance findById(int id) {
		return dao.findById(id);
	}

	@Override
	public void save(ErpInstance erpInstance) {
		dao.save(erpInstance);
	}

	@Override
	public void update(ErpInstance erpInstance) {
		ErpInstance entity = dao.findById(erpInstance.getId());
		if(entity!=null){
			entity.setInstanceName(erpInstance.getInstanceName());
		}
		dao.update(erpInstance);
		
	}

	@Override
	public void deleteById(int id) {
		dao.deleteById(id);
	}

	@Override
	public List<ErpInstance> findAllInstances() {
		return dao.findAllInstances();
	}

	@Override
	public boolean isInstanceUnique(Integer id, String instanceName) {
		ErpInstance instance = dao.findByName(instanceName);
		return ( instance == null || ((id != null) && (instance.getId() == id)));
	}

}
