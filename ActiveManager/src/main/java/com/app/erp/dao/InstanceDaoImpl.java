package com.app.erp.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.app.erp.model.ErpInstance;

@Repository("instanceDao")
public class InstanceDaoImpl extends AbstractDao<Integer, ErpInstance> implements InstanceDao {

	static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);
	
	@Override
	public ErpInstance findById(int id) {
		ErpInstance instance = getByKey(id);
		return instance;
	}

	@Override
	public void save(ErpInstance erpInstance) {
		persist(erpInstance);
		
	}
	
	@Override
	public void update(ErpInstance erpInstance) {
		update(erpInstance);
		
	}

	@Override
	public void deleteById(int id) {
		ErpInstance instance = findById(id);
		delete(instance);
	}

	@Override
	public List<ErpInstance> findAllInstances() {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("instanceName"));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
		@SuppressWarnings("unchecked")
		List<ErpInstance> instances = (List<ErpInstance>) criteria.list();
		return instances;
	}

	@Override
	public ErpInstance findByName(String instanceName) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("instanceName", instanceName));
		ErpInstance instance = (ErpInstance)crit.uniqueResult();
		return instance;
	}

	
}
