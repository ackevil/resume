package csu.resume.dao;

import java.util.List;

import csu.resume.entity.Adminuser;

public interface IAdminUserDao {
	public boolean addUser(Adminuser user);
	public boolean delUser(Adminuser user);
	public Adminuser searchUserByName(String username);
	public boolean updateUser(Adminuser user);
	public Adminuser searchUserById(int id);
	public List<Adminuser> getAllUser();
}
