package csu.resume.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import csu.resume.dao.IAdminUserDao;
import csu.resume.entity.Adminuser;
import csu.resume.service.IAdminUserService;

@Transactional(readOnly=false)
@Service
public class AdminUserServiceImpl implements IAdminUserService {

	@Autowired
	public IAdminUserDao adminUserDao;
	
	@Override
	public boolean addUser(Adminuser user) {
		// TODO Auto-generated method stub
		return adminUserDao.addUser(user);
	}

	@Override
	public boolean delUser(Adminuser user) {
		// TODO Auto-generated method stub
		return adminUserDao.delUser(user);
	}

	@Override
	public Adminuser searchUserByName(String username) {
		// TODO Auto-generated method stub
		return adminUserDao.searchUserByName(username);
	}

	@Override
	public boolean updateUser(Adminuser user) {
		// TODO Auto-generated method stub
		return adminUserDao.updateUser(user);
	}

	@Override
	public Adminuser searchUserById(int id) {
		// TODO Auto-generated method stub
		return adminUserDao.searchUserById(id);
	}

	@Override
	public List<Adminuser> getAllUser() {
		// TODO Auto-generated method stub
		return adminUserDao.getAllUser();
	}

}
