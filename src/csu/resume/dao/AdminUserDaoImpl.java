package csu.resume.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import csu.resume.base.BaseDaoImpl;
import csu.resume.entity.Adminuser;

@Transactional
@Repository
public class AdminUserDaoImpl extends BaseDaoImpl<Adminuser, String> implements IAdminUserDao {

	@Override
	public boolean addUser(Adminuser user) {
		try {
			save(user);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean delUser(Adminuser user) {
		try {
			delete(user);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Adminuser searchUserByName(String username) {
		List<Adminuser> list=findBy("adminuserName", username);
		if(list.size()!=0)
			return list.get(0);
		else
			return null;
	}

	@Override
	public boolean updateUser(Adminuser user) {
		try {
			update(user);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
		
	}

	@Override
	public Adminuser searchUserById(int id) {
		// TODO Auto-generated method stub
		
		List<Adminuser> list=findBy("adminuserId", id);
		if(list.size()!=0)
			return list.get(0);
		else
			return null;
	}
	@SuppressWarnings("unused")
	@Override
	public List<Adminuser> getAllUser() {
		// TODO Auto-generated method stub
		
		List<Adminuser> list=findAll();
		return list;
	}

}
